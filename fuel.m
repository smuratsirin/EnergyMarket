classdef fuel < handle
    properties(Constant, Access = private)
        mw_to_mwh = 3600;
        mj_to_mwh = 1/3600;
    end
    properties(Constant)
        coal_cal_value = 25000/3600;         % MJ / unit Fuel
        coal_co2_value = 2.66;               % ton CO2 / unit Fuel
        gas_cal_value = 35.069/3600;         % MJ / unit Fuel
        gas_co2_value = 0.00187;             % ton CO2 / unit Fuel
        uranium_cal_value = 3888000.0/3600;  % MJ / unit Fuel
        uranium_co2_value = 0;               % ton CO2 / unit Fuel
    end
    properties
        coal_price;         % in Euro/ton
        gas_price;          % in Euro/m3
        uranium_price;      % in Euro/kg
        wind_availability;  % in %
        co2_price;          % in Euro/ton
        current_round;      % Current active round
    end
    methods
        function fuel_update(obj,coal,gas,uranium,wind,co2,current_round)
            % This program updates the prices 
            % Arguments
            % obj.fuel_update(coal, gas, uranium, wind)
            % obj.fuel_update(coal, gas, uranium, wind, co2)
            % obj.fuel_update(coal, gas, uranium, wind, co2, current round)
            % returns: none
            
            obj.coal_price = coal;
            obj.gas_price = gas;
            obj.uranium_price = uranium;
            obj.wind_availability = wind/100;
            if nargin>5
                obj.co2_price = co2;
            end
            if nargin>6
                obj.current_round = current_round;
            end
            fprintf('\tPrices updated\n');
        end
    end
end
