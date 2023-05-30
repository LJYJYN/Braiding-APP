classdef BSSAappV01_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                        matlab.ui.Figure
        GridLayout                      matlab.ui.container.GridLayout
        LeftPanel                       matlab.ui.container.Panel
        Lamp                            matlab.ui.control.Lamp
        BraidedStructureSimulationAppLabel  matlab.ui.control.Label
        BSSALabel                       matlab.ui.control.Label
        BraidingStartButton             matlab.ui.control.Button
        StructuralOptimizationPanel     matlab.ui.container.Panel
        MechanicalTighteningCountEditField  matlab.ui.control.NumericEditField
        MechanicalTighteningCountEditFieldLabel  matlab.ui.control.Label
        MechanicalTighteningFactorEditField  matlab.ui.control.NumericEditField
        MechanicalTighteningFactorEditFieldLabel  matlab.ui.control.Label
        MechanicalTightenLabel          matlab.ui.control.Label
        Switch_2                        matlab.ui.control.Switch
        TighteningFactorEditField       matlab.ui.control.NumericEditField
        TighteningFactorEditFieldLabel  matlab.ui.control.Label
        TightenLabel                    matlab.ui.control.Label
        Switch                          matlab.ui.control.Switch
        BraidingProcessParametersPanel  matlab.ui.container.Panel
        RotationAngleDropDown           matlab.ui.control.DropDown
        RotationAngleDropDownLabel      matlab.ui.control.Label
        YarnRadiusEditField             matlab.ui.control.NumericEditField
        YarnRadiusEditFieldLabel        matlab.ui.control.Label
        BraidedSetEditField             matlab.ui.control.NumericEditField
        BraidedSetEditFieldLabel        matlab.ui.control.Label
        UnitlengthofcoordinatesEditField  matlab.ui.control.NumericEditField
        UnitlengthofcoordinatesEditFieldLabel  matlab.ui.control.Label
        RightPanel                      matlab.ui.container.Panel
        BraidingMachinePanel            matlab.ui.container.Panel
        successLamp                     matlab.ui.control.Lamp
        BraidingMechineButton           matlab.ui.control.Button
        MatrixColumnEditField           matlab.ui.control.NumericEditField
        MatrixColumnEditFieldLabel      matlab.ui.control.Label
        MatrixRowEditField              matlab.ui.control.NumericEditField
        MatrixRowEditFieldLabel         matlab.ui.control.Label
        TabGroup                        matlab.ui.container.TabGroup
        CarrierConfigurationTab         matlab.ui.container.Tab
        PositioninitializationofyarncarrierButton  matlab.ui.control.Button
        UIAxes                          matlab.ui.control.UIAxes
        CarrierPathsTab                 matlab.ui.container.Tab
        YarnNumbersEditField_3          matlab.ui.control.NumericEditField
        YarnNumbersEditField_3Label     matlab.ui.control.Label
        CarrierPathsCalculationButton   matlab.ui.control.StateButton
        ZlimZmaxEditField               matlab.ui.control.NumericEditField
        ZlimZmaxEditFieldLabel          matlab.ui.control.Label
        ZlimZminEditField               matlab.ui.control.NumericEditField
        ZlimZminEditFieldLabel          matlab.ui.control.Label
        ViewElevationEditField          matlab.ui.control.NumericEditField
        ViewElevationEditFieldLabel     matlab.ui.control.Label
        ViewAzimuthEditField            matlab.ui.control.NumericEditField
        ViewAzimuthEditFieldLabel       matlab.ui.control.Label
        UIAxes2                         matlab.ui.control.UIAxes
        YarnPathsTab                    matlab.ui.container.Tab
        YarnNumbersEditField_2          matlab.ui.control.NumericEditField
        YarnNumbersEditField_2Label     matlab.ui.control.Label
        ViewAzimuthEditField_2          matlab.ui.control.NumericEditField
        ViewAzimuthEditField_2Label     matlab.ui.control.Label
        ZlimZminEditField_2             matlab.ui.control.NumericEditField
        ZlimZminEditField_2Label        matlab.ui.control.Label
        ViewElevationEditField_2        matlab.ui.control.NumericEditField
        ViewElevationEditField_2Label   matlab.ui.control.Label
        ZlimZmaxEditField_2             matlab.ui.control.NumericEditField
        ZlimZmaxEditField_2Label        matlab.ui.control.Label
        YarnPathsCalculationButton      matlab.ui.control.StateButton
        UIAxes2_2                       matlab.ui.control.UIAxes
        FabricStructureTab              matlab.ui.container.Tab
        YarnNumbersEditField            matlab.ui.control.NumericEditField
        YarnNumbersEditFieldLabel       matlab.ui.control.Label
        ViewAzimuthEditField_3          matlab.ui.control.NumericEditField
        ViewAzimuthEditField_3Label     matlab.ui.control.Label
        ZlimZminEditField_3             matlab.ui.control.NumericEditField
        ZlimZminEditField_3Label        matlab.ui.control.Label
        ViewElevationEditField_3        matlab.ui.control.NumericEditField
        ViewElevationEditField_3Label   matlab.ui.control.Label
        ZlimZmaxEditField_3             matlab.ui.control.NumericEditField
        ZlimZmaxEditField_3Label        matlab.ui.control.Label
        FabricStructureCalculationButton  matlab.ui.control.StateButton
        UIAxes2_3                       matlab.ui.control.UIAxes
    end

    % Properties that correspond to apps with auto-reflow
    properties (Access = private)
        onePanelWidth = 576;
    end


    properties (Access = private)
        %         R  % Description

        %          x_Yarn = zeros(m,4*n+1);
        %          y_Yarn = zeros(m,4*n+1);
        %          z_Yarn = zeros(m,4*n+1);



        % Description
    end

    methods (Access = private)


    end


    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: BraidingMechineButton
        function BraidingMechineButtonPushed(app, event)
            M = app.MatrixRowEditField.Value;   %矩阵Y方向行数
            N = app.MatrixColumnEditField.Value; %矩阵X方向列数

            if M<=0
                app.successLamp.Color = "1.00,0.00,0.00";%判断矩阵是否建立
            end
            if M>0
                if N<=0
                    app.successLamp.Color = "r";
                else
                    app.successLamp.Color = "g";
                end
            end
            app.BraidingMechineButton.UserData.M = M;   %矩阵Y方向行数
            app.BraidingMechineButton.UserData.N = N; %矩阵X方向列数

        end

        % Button pushed function: 
        % PositioninitializationofyarncarrierButton
        function PositioninitializationofyarncarrierButtonPushed(app, event)
            M = app.BraidingMechineButton.UserData.M;
            N = app.BraidingMechineButton.UserData.N;
            m = 120;
            n = 30;  %纺织步数
            tighting_enable = 0;
            number_tighten = 1;
            ratio_tighten = 0.4;
            X_ratio_tighten = 1;
            Y_ratio_tighten = 1;
            Z_ratio_tighten = 1;
            switch_tighten = 1
            a = 1;
            r = 0.3;
            R = 1;

            yarnbriding_main

            for i=1:m
                scatter(app.UIAxes,x_Yarn(i,1),y_Yarn(i,1),'MarkerFaceColor','black');
                hold(app.UIAxes,'on')
            end
            grid(app.UIAxes,'on')

            app.PositioninitializationofyarncarrierButton.UserData.x_Yarn = x_Yarn;
            app.PositioninitializationofyarncarrierButton.UserData.x_Yarn = y_Yarn;
            app.PositioninitializationofyarncarrierButton.UserData.x_Yarn = z_Yarn;
        end

        % Size changed function: CarrierConfigurationTab
        function CarrierConfigurationTabSizeChanged(app, event)
            position = app.CarrierConfigurationTab.Position;

        end

        % Button pushed function: BraidingStartButton
        function BraidingStartButtonPushed(app, event)
            M = app.BraidingMechineButton.UserData.M;
            N = app.BraidingMechineButton.UserData.N;
            a = app.UnitlengthofcoordinatesEditField.Value;     %坐标单位长度
            n = app.BraidedSetEditField.Value;                  %纺织步数
            r = app.YarnRadiusEditField.Value;                  %纤维半径
            m = 120;
            switch_tighten = app.Switch.Value;                  %收紧开关
            R = app.RotationAngleDropDown.UserData.R;   %旋转角度
            %             X_ratio_tighten = app.Switch.Value; %坐标收紧系数
            %             Y_ratio_tighten = app.Switch.Value;
            %             Z_ratio_tighten = app.Switch.Value;
            %             ratio_tighten =  app.Switch_2.Value;
            %             number_tighten = app.Switch_2.Value;
            %             ratio_tighten =  app.Switch_2.UserData.ratio_tighten;
            %             number_tighten = app.Switch_2.UserData.number_tighten;

            X_ratio_tighten = app.Switch.UserData.X_ratio_tighten; %坐标收紧系数
            Y_ratio_tighten = app.Switch.UserData.Y_ratio_tighten;
            Z_ratio_tighten = app.Switch.UserData.Z_ratio_tighten;
            ratio_tighten = app.Switch_2.Value;                              %力学开关
            ratio_tighten = app.MechanicalTighteningFactorEditField.Value;  %力学系数
            number_tighten = app.MechanicalTighteningCountEditField.Value;  %力学收紧次数
            tighting_enable = 0;




            yarnbriding_main

            if a == 0||n == 0||r == 0
                app.Lamp.Color = "r";
            else
                app.Lamp.Color = "g";
            end
            app.BraidingStartButton.UserData.a = a;
            app.BraidingStartButton.UserData.n = n;
            app.BraidingStartButton.UserData.r = r;
            app.BraidingStartButton.UserData.x_Yarn = x_Yarn;
            app.BraidingStartButton.UserData.y_Yarn = y_Yarn;
            app.BraidingStartButton.UserData.z_Yarn = z_Yarn;

            app.BraidingStartButton.UserData.x_change = x_change;
            app.BraidingStartButton.UserData.y_change = y_change;
            app.BraidingStartButton.UserData.z_change = z_change;

            app.BraidingStartButton.UserData.xq = xq;
            app.BraidingStartButton.UserData.yq = yq;
            app.BraidingStartButton.UserData.zq = zq;
            app.BraidingStartButton.UserData.n
        end

        % Value changed function: CarrierPathsCalculationButton
        function CarrierPathsCalculationButtonValueChanged(app, event)
            value = app.CarrierPathsCalculationButton.Value;
            view_azimuth = app.ViewAzimuthEditField.Value;
            view_elevation = app.ViewElevationEditField.Value;
            zlim_zmin = app.ZlimZminEditField.Value;
            zlim_zmax = app.ZlimZmaxEditField.Value;
            n = app.BraidingStartButton.UserData.n;
            m = app.YarnNumbersEditField_3.Value;
            x_Yarn = app.BraidingStartButton.UserData.x_Yarn;
            y_Yarn = app.BraidingStartButton.UserData.y_Yarn;
            z_Yarn = app.BraidingStartButton.UserData.z_Yarn;

            for i=1:m

                plot3(app.UIAxes2,x_Yarn(i,1:4*n),y_Yarn(i,1:4*n),z_Yarn(i,1:4*n),'linewidth',3)
                hold(app.UIAxes2,'on');
            end
            hold(app.UIAxes2,'off');
            view(app.UIAxes2,[view_azimuth view_elevation])
            zlim(app.UIAxes2,[zlim_zmin zlim_zmax])
            grid(app.UIAxes2,'on');

        end

        % Value changed function: YarnPathsCalculationButton
        function YarnPathsCalculationButtonValueChanged(app, event)
            value = app.YarnPathsCalculationButton.Value;
            view_azimuth_2 = app.ViewAzimuthEditField_2.Value;
            view_elevation_2 = app.ViewElevationEditField_2.Value;
            zlim_zmin_2 = app.ZlimZminEditField_2.Value;
            zlim_zmax_2 = app.ZlimZmaxEditField_2.Value;
            m = app.YarnNumbersEditField_2.Value;
            xq = app.BraidingStartButton.UserData.xq;
            yq = app.BraidingStartButton.UserData.yq;
            zq = app.BraidingStartButton.UserData.zq;

            for k = 1:m

                plot3(app.UIAxes2_2,xq(k,:),yq(k,:),zq(k,:),'black')
                hold (app.UIAxes2_2,'on')
            end
            hold(app.UIAxes2_2,'off');
            view(app.UIAxes2_2,[view_azimuth_2 view_elevation_2])
            zlim(app.UIAxes2_2,[zlim_zmin_2 zlim_zmax_2])
            grid(app.UIAxes2_2,"on")
        end

        % Value changed function: RotationAngleDropDown
        function RotationAngleDropDownValueChanged(app, event)
            value = app.RotationAngleDropDown.Value;
            switch value
                case "60°"
                    R = 1;
                case "120°"
                    R = 2;
                case "180°"
                    R = 3;
                case"240°"
                    R = 4;
                case "300°"
                    R = 5;
            end

            app.RotationAngleDropDown.UserData.R = R;
        end

        % Drop down opening function: RotationAngleDropDown
        function RotationAngleDropDownOpening(app, event)

        end

        % Value changed function: FabricStructureCalculationButton
        function FabricStructureCalculationButtonValueChanged(app, event)
            value = app.FabricStructureCalculationButton.Value;
            view_azimuth_3 = app.ViewAzimuthEditField_3.Value;
            view_elevation_3 = app.ViewElevationEditField_3.Value;
            zlim_zmin_3 = app.ZlimZminEditField_3.Value;
            zlim_zmax_3 = app.ZlimZmaxEditField_3.Value;
            r = app.BraidingStartButton.UserData.r;
            m = app.YarnNumbersEditField.Value;
            xq = app.BraidingStartButton.UserData.xq;
            yq = app.BraidingStartButton.UserData.yq;
            zq = app.BraidingStartButton.UserData.zq;

            %             yarnbriding_main

            col=['r','g','b','c','y','m','k'];
            h=size(xq);
            yarnNum=h(1);
            pointnum=h(2);
            for i=1:m
                [X,Y,Z]=TubeLike(xq(i,1:pointnum),yq(i,1:pointnum),zq(i,1:pointnum),r);
                surf(app.UIAxes2_3,X,Y,Z,'FaceColor',col(mod(i,7)+1),'LineStyle',':');

                patch(app.UIAxes2_3,X(:,1),Y(:,1),Z(:,1),col(mod(i,7)+1));
                patch(app.UIAxes2_3,X(:,pointnum),Y(:,pointnum),Z(:,pointnum),col(mod(i,7)+1));
                hold (app.UIAxes2_3,'on');

            end
            hold (app.UIAxes2_3,'off');
            view(app.UIAxes2_3,[view_azimuth_3 view_elevation_3])
            zlim(app.UIAxes2_3,[zlim_zmin_3 zlim_zmax_3])
            grid(app.UIAxes2_3,"on")
        end

        % Value changed function: YarnNumbersEditField_3
        function YarnNumbersEditField_3ValueChanged(app, event)
            value = app.YarnNumbersEditField_3.Value;

        end

        % Value changed function: Switch
        function SwitchValueChanged(app, event)
            value = app.Switch.Value;
            %if条件判断
            %string campare 字符串比较

            if strcmp(value, "On")
                switch_tighten = 1;
                X_ratio_tighten = app.TighteningFactorEditField.Value;
                Y_ratio_tighten = app.TighteningFactorEditField.Value;
                Z_ratio_tighten = app.TighteningFactorEditField.Value;
            else
                x_Yarn = app.PositioninitializationofyarncarrierButton.UserData.x_Yarn;
                y_Yarn = app.PositioninitializationofyarncarrierButton.UserData.y_Yarn;
                z_Yarn = app.PositioninitializationofyarncarrierButton.UserData.z_Yarn;
            end
            app.Switch.UserData.X_ratio_tighten = X_ratio_tighten;
            app.Switch.UserData.Y_ratio_tighten = Y_ratio_tighten;
            app.Switch.UserData.Z_ratio_tighten = Z_ratio_tighten;
            app.Switch.UserData.switch_tighten = switch_tighten;
        end

        % Value changed function: Switch_2
        function Switch_2ValueChanged(app, event)
            value = app.Switch_2.Value;
            if strcmp(value, "On")
                ratio_tighten = app.MechanicalTighteningFactorEditField.Value;
                number_tighten = app.MechanicalTighteningCountEditField.Value;

            else
                number_tighten = 0;
            end

            app.Switch_2.UserData.ratio_tighten = ratio_tighten ;
            app.Switch_2.UserData.number_tighten = number_tighten;
        end

        % Value changed function: MechanicalTighteningCountEditField
        function MechanicalTighteningCountEditFieldValueChanged(app, event)
            value = app.MechanicalTighteningCountEditField.Value;

        end

        % Value changed function: 
        % MechanicalTighteningFactorEditField
        function MechanicalTighteningFactorEditFieldValueChanged(app, event)
            value = app.MechanicalTighteningFactorEditField.Value;

        end

        % Value changed function: TighteningFactorEditField
        function TighteningFactorEditFieldValueChanged(app, event)
            value = app.TighteningFactorEditField.Value;

        end

        % Value changed function: YarnRadiusEditField
        function YarnRadiusEditFieldValueChanged(app, event)
            value = app.YarnRadiusEditField.Value;

        end

        % Value changed function: UnitlengthofcoordinatesEditField
        function UnitlengthofcoordinatesEditFieldValueChanged(app, event)
            value = app.UnitlengthofcoordinatesEditField.Value;

        end

        % Size changed function: StructuralOptimizationPanel
        function StructuralOptimizationPanelSizeChanged(app, event)
            position = app.StructuralOptimizationPanel.Position;

        end

        % Changes arrangement of the app based on UIFigure width
        function updateAppLayout(app, event)
            currentFigureWidth = app.UIFigure.Position(3);
            if(currentFigureWidth <= app.onePanelWidth)
                % Change to a 2x1 grid
                app.GridLayout.RowHeight = {788, 788};
                app.GridLayout.ColumnWidth = {'1x'};
                app.RightPanel.Layout.Row = 2;
                app.RightPanel.Layout.Column = 1;
            else
                % Change to a 1x2 grid
                app.GridLayout.RowHeight = {'1x'};
                app.GridLayout.ColumnWidth = {362, '1x'};
                app.RightPanel.Layout.Row = 1;
                app.RightPanel.Layout.Column = 2;
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.AutoResizeChildren = 'off';
            app.UIFigure.Position = [100 100 1144 788];
            app.UIFigure.Name = 'MATLAB App';
            app.UIFigure.SizeChangedFcn = createCallbackFcn(app, @updateAppLayout, true);

            % Create GridLayout
            app.GridLayout = uigridlayout(app.UIFigure);
            app.GridLayout.ColumnWidth = {362, '1x'};
            app.GridLayout.RowHeight = {'1x'};
            app.GridLayout.ColumnSpacing = 0;
            app.GridLayout.RowSpacing = 0;
            app.GridLayout.Padding = [0 0 0 0];
            app.GridLayout.Scrollable = 'on';

            % Create LeftPanel
            app.LeftPanel = uipanel(app.GridLayout);
            app.LeftPanel.Layout.Row = 1;
            app.LeftPanel.Layout.Column = 1;

            % Create BraidingProcessParametersPanel
            app.BraidingProcessParametersPanel = uipanel(app.LeftPanel);
            app.BraidingProcessParametersPanel.Title = 'Braiding Process Parameters';
            app.BraidingProcessParametersPanel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.BraidingProcessParametersPanel.FontName = 'Times New Roman';
            app.BraidingProcessParametersPanel.FontWeight = 'bold';
            app.BraidingProcessParametersPanel.FontSize = 20;
            app.BraidingProcessParametersPanel.Position = [0 403 361 224];

            % Create UnitlengthofcoordinatesEditFieldLabel
            app.UnitlengthofcoordinatesEditFieldLabel = uilabel(app.BraidingProcessParametersPanel);
            app.UnitlengthofcoordinatesEditFieldLabel.HorizontalAlignment = 'right';
            app.UnitlengthofcoordinatesEditFieldLabel.FontName = 'Times New Roman';
            app.UnitlengthofcoordinatesEditFieldLabel.FontSize = 15;
            app.UnitlengthofcoordinatesEditFieldLabel.Position = [19 154 163 22];
            app.UnitlengthofcoordinatesEditFieldLabel.Text = 'Unit length of coordinates';

            % Create UnitlengthofcoordinatesEditField
            app.UnitlengthofcoordinatesEditField = uieditfield(app.BraidingProcessParametersPanel, 'numeric');
            app.UnitlengthofcoordinatesEditField.ValueChangedFcn = createCallbackFcn(app, @UnitlengthofcoordinatesEditFieldValueChanged, true);
            app.UnitlengthofcoordinatesEditField.Position = [209 148 128 33];

            % Create BraidedSetEditFieldLabel
            app.BraidedSetEditFieldLabel = uilabel(app.BraidingProcessParametersPanel);
            app.BraidedSetEditFieldLabel.HorizontalAlignment = 'right';
            app.BraidedSetEditFieldLabel.FontName = 'Times New Roman';
            app.BraidedSetEditFieldLabel.FontSize = 15;
            app.BraidedSetEditFieldLabel.Position = [18 109 76 22];
            app.BraidedSetEditFieldLabel.Text = 'Braided Set';

            % Create BraidedSetEditField
            app.BraidedSetEditField = uieditfield(app.BraidingProcessParametersPanel, 'numeric');
            app.BraidedSetEditField.Position = [208 103 129 33];

            % Create YarnRadiusEditFieldLabel
            app.YarnRadiusEditFieldLabel = uilabel(app.BraidingProcessParametersPanel);
            app.YarnRadiusEditFieldLabel.HorizontalAlignment = 'right';
            app.YarnRadiusEditFieldLabel.FontName = 'Times New Roman';
            app.YarnRadiusEditFieldLabel.FontSize = 15;
            app.YarnRadiusEditFieldLabel.Position = [18 61 79 22];
            app.YarnRadiusEditFieldLabel.Text = 'Yarn Radius';

            % Create YarnRadiusEditField
            app.YarnRadiusEditField = uieditfield(app.BraidingProcessParametersPanel, 'numeric');
            app.YarnRadiusEditField.ValueChangedFcn = createCallbackFcn(app, @YarnRadiusEditFieldValueChanged, true);
            app.YarnRadiusEditField.Position = [209 55 128 33];

            % Create RotationAngleDropDownLabel
            app.RotationAngleDropDownLabel = uilabel(app.BraidingProcessParametersPanel);
            app.RotationAngleDropDownLabel.HorizontalAlignment = 'right';
            app.RotationAngleDropDownLabel.FontName = 'Times New Roman';
            app.RotationAngleDropDownLabel.FontSize = 15;
            app.RotationAngleDropDownLabel.Position = [19 19 97 22];
            app.RotationAngleDropDownLabel.Text = 'Rotation Angle';

            % Create RotationAngleDropDown
            app.RotationAngleDropDown = uidropdown(app.BraidingProcessParametersPanel);
            app.RotationAngleDropDown.Items = {'0°', '60°', '120°', '180°', '240°', '300°'};
            app.RotationAngleDropDown.DropDownOpeningFcn = createCallbackFcn(app, @RotationAngleDropDownOpening, true);
            app.RotationAngleDropDown.ValueChangedFcn = createCallbackFcn(app, @RotationAngleDropDownValueChanged, true);
            app.RotationAngleDropDown.FontName = 'Times New Roman';
            app.RotationAngleDropDown.FontSize = 15;
            app.RotationAngleDropDown.Position = [210 15 127 30];
            app.RotationAngleDropDown.Value = '0°';

            % Create StructuralOptimizationPanel
            app.StructuralOptimizationPanel = uipanel(app.LeftPanel);
            app.StructuralOptimizationPanel.Title = 'Structural Optimization';
            app.StructuralOptimizationPanel.SizeChangedFcn = createCallbackFcn(app, @StructuralOptimizationPanelSizeChanged, true);
            app.StructuralOptimizationPanel.FontName = 'Times New Roman';
            app.StructuralOptimizationPanel.FontWeight = 'bold';
            app.StructuralOptimizationPanel.FontSize = 20;
            app.StructuralOptimizationPanel.Position = [0 95 361 295];

            % Create Switch
            app.Switch = uiswitch(app.StructuralOptimizationPanel, 'slider');
            app.Switch.ValueChangedFcn = createCallbackFcn(app, @SwitchValueChanged, true);
            app.Switch.FontName = 'Times New Roman';
            app.Switch.FontSize = 15;
            app.Switch.FontWeight = 'bold';
            app.Switch.Position = [246 222 54 24];

            % Create TightenLabel
            app.TightenLabel = uilabel(app.StructuralOptimizationPanel);
            app.TightenLabel.FontName = 'Times New Roman';
            app.TightenLabel.FontSize = 15;
            app.TightenLabel.FontWeight = 'bold';
            app.TightenLabel.Position = [19 219 125 28];
            app.TightenLabel.Text = 'Tighten';

            % Create TighteningFactorEditFieldLabel
            app.TighteningFactorEditFieldLabel = uilabel(app.StructuralOptimizationPanel);
            app.TighteningFactorEditFieldLabel.HorizontalAlignment = 'right';
            app.TighteningFactorEditFieldLabel.FontName = 'Times New Roman';
            app.TighteningFactorEditFieldLabel.FontSize = 15;
            app.TighteningFactorEditFieldLabel.Position = [18 177 113 22];
            app.TighteningFactorEditFieldLabel.Text = 'Tightening Factor';

            % Create TighteningFactorEditField
            app.TighteningFactorEditField = uieditfield(app.StructuralOptimizationPanel, 'numeric');
            app.TighteningFactorEditField.ValueChangedFcn = createCallbackFcn(app, @TighteningFactorEditFieldValueChanged, true);
            app.TighteningFactorEditField.Position = [210 171 127 34];

            % Create Switch_2
            app.Switch_2 = uiswitch(app.StructuralOptimizationPanel, 'slider');
            app.Switch_2.ValueChangedFcn = createCallbackFcn(app, @Switch_2ValueChanged, true);
            app.Switch_2.FontName = 'Times New Roman';
            app.Switch_2.FontSize = 15;
            app.Switch_2.FontWeight = 'bold';
            app.Switch_2.Position = [245 132 54 24];

            % Create MechanicalTightenLabel
            app.MechanicalTightenLabel = uilabel(app.StructuralOptimizationPanel);
            app.MechanicalTightenLabel.FontName = 'Times New Roman';
            app.MechanicalTightenLabel.FontSize = 15;
            app.MechanicalTightenLabel.FontWeight = 'bold';
            app.MechanicalTightenLabel.Position = [19 127 133 28];
            app.MechanicalTightenLabel.Text = 'Mechanical Tighten';

            % Create MechanicalTighteningFactorEditFieldLabel
            app.MechanicalTighteningFactorEditFieldLabel = uilabel(app.StructuralOptimizationPanel);
            app.MechanicalTighteningFactorEditFieldLabel.HorizontalAlignment = 'right';
            app.MechanicalTighteningFactorEditFieldLabel.FontName = 'Times New Roman';
            app.MechanicalTighteningFactorEditFieldLabel.FontSize = 15;
            app.MechanicalTighteningFactorEditFieldLabel.Position = [18 82 187 22];
            app.MechanicalTighteningFactorEditFieldLabel.Text = 'Mechanical Tightening Factor';

            % Create MechanicalTighteningFactorEditField
            app.MechanicalTighteningFactorEditField = uieditfield(app.StructuralOptimizationPanel, 'numeric');
            app.MechanicalTighteningFactorEditField.ValueChangedFcn = createCallbackFcn(app, @MechanicalTighteningFactorEditFieldValueChanged, true);
            app.MechanicalTighteningFactorEditField.Position = [210 76 126 34];

            % Create MechanicalTighteningCountEditFieldLabel
            app.MechanicalTighteningCountEditFieldLabel = uilabel(app.StructuralOptimizationPanel);
            app.MechanicalTighteningCountEditFieldLabel.HorizontalAlignment = 'right';
            app.MechanicalTighteningCountEditFieldLabel.FontName = 'Times New Roman';
            app.MechanicalTighteningCountEditFieldLabel.FontSize = 15;
            app.MechanicalTighteningCountEditFieldLabel.Position = [19 25 184 22];
            app.MechanicalTighteningCountEditFieldLabel.Text = 'Mechanical Tightening Count';

            % Create MechanicalTighteningCountEditField
            app.MechanicalTighteningCountEditField = uieditfield(app.StructuralOptimizationPanel, 'numeric');
            app.MechanicalTighteningCountEditField.ValueChangedFcn = createCallbackFcn(app, @MechanicalTighteningCountEditFieldValueChanged, true);
            app.MechanicalTighteningCountEditField.Position = [208 19 126 34];

            % Create BraidingStartButton
            app.BraidingStartButton = uibutton(app.LeftPanel, 'push');
            app.BraidingStartButton.ButtonPushedFcn = createCallbackFcn(app, @BraidingStartButtonPushed, true);
            app.BraidingStartButton.IconAlignment = 'bottom';
            app.BraidingStartButton.WordWrap = 'on';
            app.BraidingStartButton.BackgroundColor = [0 0.4471 0.7412];
            app.BraidingStartButton.FontName = 'Times New Roman';
            app.BraidingStartButton.FontSize = 20;
            app.BraidingStartButton.FontWeight = 'bold';
            app.BraidingStartButton.FontColor = [1 1 1];
            app.BraidingStartButton.Position = [43 24 204 54];
            app.BraidingStartButton.Text = 'Braiding Start ';

            % Create BSSALabel
            app.BSSALabel = uilabel(app.LeftPanel);
            app.BSSALabel.BackgroundColor = [1 1 1];
            app.BSSALabel.HorizontalAlignment = 'center';
            app.BSSALabel.VerticalAlignment = 'top';
            app.BSSALabel.FontName = 'Times New Roman';
            app.BSSALabel.FontSize = 50;
            app.BSSALabel.FontWeight = 'bold';
            app.BSSALabel.FontColor = [0 0.4471 0.7412];
            app.BSSALabel.Position = [2 727 357 56];
            app.BSSALabel.Text = 'BSSA';

            % Create BraidedStructureSimulationAppLabel
            app.BraidedStructureSimulationAppLabel = uilabel(app.LeftPanel);
            app.BraidedStructureSimulationAppLabel.BackgroundColor = [0.9294 0.6941 0.1255];
            app.BraidedStructureSimulationAppLabel.HorizontalAlignment = 'center';
            app.BraidedStructureSimulationAppLabel.FontName = 'Times New Roman';
            app.BraidedStructureSimulationAppLabel.FontSize = 20;
            app.BraidedStructureSimulationAppLabel.FontWeight = 'bold';
            app.BraidedStructureSimulationAppLabel.FontColor = [1 1 1];
            app.BraidedStructureSimulationAppLabel.Position = [3 627 356 99];
            app.BraidedStructureSimulationAppLabel.Text = 'Braided Structure Simulation App';

            % Create Lamp
            app.Lamp = uilamp(app.LeftPanel);
            app.Lamp.Position = [286 28 50 50];
            app.Lamp.Color = [1 0 0];

            % Create RightPanel
            app.RightPanel = uipanel(app.GridLayout);
            app.RightPanel.Layout.Row = 1;
            app.RightPanel.Layout.Column = 2;

            % Create TabGroup
            app.TabGroup = uitabgroup(app.RightPanel);
            app.TabGroup.Position = [10 12 761 681];

            % Create CarrierConfigurationTab
            app.CarrierConfigurationTab = uitab(app.TabGroup);
            app.CarrierConfigurationTab.SizeChangedFcn = createCallbackFcn(app, @CarrierConfigurationTabSizeChanged, true);
            app.CarrierConfigurationTab.Title = 'Carrier Configuration';
            app.CarrierConfigurationTab.BackgroundColor = [0.9412 0.9412 0.9412];

            % Create UIAxes
            app.UIAxes = uiaxes(app.CarrierConfigurationTab);
            xlabel(app.UIAxes, 'X')
            ylabel(app.UIAxes, 'Y')
            zlabel(app.UIAxes, 'Z')
            app.UIAxes.FontName = 'Times New Roman';
            app.UIAxes.FontWeight = 'bold';
            app.UIAxes.FontSize = 15;
            app.UIAxes.Position = [35 48 667 609];

            % Create PositioninitializationofyarncarrierButton
            app.PositioninitializationofyarncarrierButton = uibutton(app.CarrierConfigurationTab, 'push');
            app.PositioninitializationofyarncarrierButton.ButtonPushedFcn = createCallbackFcn(app, @PositioninitializationofyarncarrierButtonPushed, true);
            app.PositioninitializationofyarncarrierButton.BackgroundColor = [0 0.4471 0.7412];
            app.PositioninitializationofyarncarrierButton.FontName = 'Times New Roman';
            app.PositioninitializationofyarncarrierButton.FontSize = 15;
            app.PositioninitializationofyarncarrierButton.FontWeight = 'bold';
            app.PositioninitializationofyarncarrierButton.FontColor = [1 1 1];
            app.PositioninitializationofyarncarrierButton.Position = [269 23 253 26];
            app.PositioninitializationofyarncarrierButton.Text = 'Position initialization of yarn carrier';

            % Create CarrierPathsTab
            app.CarrierPathsTab = uitab(app.TabGroup);
            app.CarrierPathsTab.Title = 'Carrier Paths';

            % Create UIAxes2
            app.UIAxes2 = uiaxes(app.CarrierPathsTab);
            xlabel(app.UIAxes2, 'X')
            ylabel(app.UIAxes2, 'Y')
            zlabel(app.UIAxes2, 'Z')
            app.UIAxes2.FontName = 'Times New Roman';
            app.UIAxes2.FontWeight = 'bold';
            app.UIAxes2.FontSize = 15;
            app.UIAxes2.Position = [1 1 521 656];

            % Create ViewAzimuthEditFieldLabel
            app.ViewAzimuthEditFieldLabel = uilabel(app.CarrierPathsTab);
            app.ViewAzimuthEditFieldLabel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.ViewAzimuthEditFieldLabel.HorizontalAlignment = 'center';
            app.ViewAzimuthEditFieldLabel.FontName = 'Times New Roman';
            app.ViewAzimuthEditFieldLabel.FontSize = 15;
            app.ViewAzimuthEditFieldLabel.FontWeight = 'bold';
            app.ViewAzimuthEditFieldLabel.FontColor = [0.149 0.149 0.149];
            app.ViewAzimuthEditFieldLabel.Position = [547 539 98 33];
            app.ViewAzimuthEditFieldLabel.Text = 'View Azimuth';

            % Create ViewAzimuthEditField
            app.ViewAzimuthEditField = uieditfield(app.CarrierPathsTab, 'numeric');
            app.ViewAzimuthEditField.FontName = 'Times New Roman';
            app.ViewAzimuthEditField.FontSize = 15;
            app.ViewAzimuthEditField.FontWeight = 'bold';
            app.ViewAzimuthEditField.Position = [654 539 79 33];

            % Create ViewElevationEditFieldLabel
            app.ViewElevationEditFieldLabel = uilabel(app.CarrierPathsTab);
            app.ViewElevationEditFieldLabel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.ViewElevationEditFieldLabel.HorizontalAlignment = 'center';
            app.ViewElevationEditFieldLabel.FontName = 'Times New Roman';
            app.ViewElevationEditFieldLabel.FontSize = 15;
            app.ViewElevationEditFieldLabel.FontWeight = 'bold';
            app.ViewElevationEditFieldLabel.FontColor = [0.149 0.149 0.149];
            app.ViewElevationEditFieldLabel.Position = [546 461 102 33];
            app.ViewElevationEditFieldLabel.Text = 'View Elevation';

            % Create ViewElevationEditField
            app.ViewElevationEditField = uieditfield(app.CarrierPathsTab, 'numeric');
            app.ViewElevationEditField.FontName = 'Times New Roman';
            app.ViewElevationEditField.FontSize = 15;
            app.ViewElevationEditField.FontWeight = 'bold';
            app.ViewElevationEditField.Position = [654 461 79 33];

            % Create ZlimZminEditFieldLabel
            app.ZlimZminEditFieldLabel = uilabel(app.CarrierPathsTab);
            app.ZlimZminEditFieldLabel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.ZlimZminEditFieldLabel.FontName = 'Times New Roman';
            app.ZlimZminEditFieldLabel.FontSize = 15;
            app.ZlimZminEditFieldLabel.FontWeight = 'bold';
            app.ZlimZminEditFieldLabel.FontColor = [0.149 0.149 0.149];
            app.ZlimZminEditFieldLabel.Position = [548 378 103 33];
            app.ZlimZminEditFieldLabel.Text = 'Zlim Zmin';

            % Create ZlimZminEditField
            app.ZlimZminEditField = uieditfield(app.CarrierPathsTab, 'numeric');
            app.ZlimZminEditField.FontName = 'Times New Roman';
            app.ZlimZminEditField.FontSize = 15;
            app.ZlimZminEditField.FontWeight = 'bold';
            app.ZlimZminEditField.Position = [657 378 79 33];

            % Create ZlimZmaxEditFieldLabel
            app.ZlimZmaxEditFieldLabel = uilabel(app.CarrierPathsTab);
            app.ZlimZmaxEditFieldLabel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.ZlimZmaxEditFieldLabel.FontName = 'Times New Roman';
            app.ZlimZmaxEditFieldLabel.FontSize = 15;
            app.ZlimZmaxEditFieldLabel.FontWeight = 'bold';
            app.ZlimZmaxEditFieldLabel.FontColor = [0.149 0.149 0.149];
            app.ZlimZmaxEditFieldLabel.Position = [548 296 103 33];
            app.ZlimZmaxEditFieldLabel.Text = 'Zlim Zmax';

            % Create ZlimZmaxEditField
            app.ZlimZmaxEditField = uieditfield(app.CarrierPathsTab, 'numeric');
            app.ZlimZmaxEditField.FontName = 'Times New Roman';
            app.ZlimZmaxEditField.FontSize = 15;
            app.ZlimZmaxEditField.FontWeight = 'bold';
            app.ZlimZmaxEditField.Position = [657 296 79 33];

            % Create CarrierPathsCalculationButton
            app.CarrierPathsCalculationButton = uibutton(app.CarrierPathsTab, 'state');
            app.CarrierPathsCalculationButton.ValueChangedFcn = createCallbackFcn(app, @CarrierPathsCalculationButtonValueChanged, true);
            app.CarrierPathsCalculationButton.IconAlignment = 'center';
            app.CarrierPathsCalculationButton.Text = {'Carrier Paths '; ' Calculation'};
            app.CarrierPathsCalculationButton.BackgroundColor = [0 0.4471 0.7412];
            app.CarrierPathsCalculationButton.FontName = 'Times New Roman';
            app.CarrierPathsCalculationButton.FontSize = 20;
            app.CarrierPathsCalculationButton.FontWeight = 'bold';
            app.CarrierPathsCalculationButton.FontColor = [1 1 1];
            app.CarrierPathsCalculationButton.Position = [549 65 189 63];

            % Create YarnNumbersEditField_3Label
            app.YarnNumbersEditField_3Label = uilabel(app.CarrierPathsTab);
            app.YarnNumbersEditField_3Label.BackgroundColor = [0.9412 0.9412 0.9412];
            app.YarnNumbersEditField_3Label.FontName = 'Times New Roman';
            app.YarnNumbersEditField_3Label.FontSize = 15;
            app.YarnNumbersEditField_3Label.FontWeight = 'bold';
            app.YarnNumbersEditField_3Label.FontColor = [0.149 0.149 0.149];
            app.YarnNumbersEditField_3Label.Position = [549 215 103 33];
            app.YarnNumbersEditField_3Label.Text = 'Yarn Numbers';

            % Create YarnNumbersEditField_3
            app.YarnNumbersEditField_3 = uieditfield(app.CarrierPathsTab, 'numeric');
            app.YarnNumbersEditField_3.ValueChangedFcn = createCallbackFcn(app, @YarnNumbersEditField_3ValueChanged, true);
            app.YarnNumbersEditField_3.FontName = 'Times New Roman';
            app.YarnNumbersEditField_3.FontSize = 15;
            app.YarnNumbersEditField_3.FontWeight = 'bold';
            app.YarnNumbersEditField_3.Position = [658 215 79 33];

            % Create YarnPathsTab
            app.YarnPathsTab = uitab(app.TabGroup);
            app.YarnPathsTab.Title = 'Yarn Paths';

            % Create UIAxes2_2
            app.UIAxes2_2 = uiaxes(app.YarnPathsTab);
            xlabel(app.UIAxes2_2, 'X')
            ylabel(app.UIAxes2_2, 'Y')
            zlabel(app.UIAxes2_2, 'Z')
            app.UIAxes2_2.FontName = 'Times New Roman';
            app.UIAxes2_2.FontWeight = 'bold';
            app.UIAxes2_2.FontSize = 15;
            app.UIAxes2_2.Position = [1 1 521 656];

            % Create YarnPathsCalculationButton
            app.YarnPathsCalculationButton = uibutton(app.YarnPathsTab, 'state');
            app.YarnPathsCalculationButton.ValueChangedFcn = createCallbackFcn(app, @YarnPathsCalculationButtonValueChanged, true);
            app.YarnPathsCalculationButton.IconAlignment = 'center';
            app.YarnPathsCalculationButton.Text = {'Yarn Paths '; ' Calculation'};
            app.YarnPathsCalculationButton.BackgroundColor = [0 0.4471 0.7412];
            app.YarnPathsCalculationButton.FontName = 'Times New Roman';
            app.YarnPathsCalculationButton.FontSize = 20;
            app.YarnPathsCalculationButton.FontWeight = 'bold';
            app.YarnPathsCalculationButton.FontColor = [1 1 1];
            app.YarnPathsCalculationButton.Position = [549 65 190 63];

            % Create ZlimZmaxEditField_2Label
            app.ZlimZmaxEditField_2Label = uilabel(app.YarnPathsTab);
            app.ZlimZmaxEditField_2Label.BackgroundColor = [0.9412 0.9412 0.9412];
            app.ZlimZmaxEditField_2Label.FontName = 'Times New Roman';
            app.ZlimZmaxEditField_2Label.FontSize = 15;
            app.ZlimZmaxEditField_2Label.FontWeight = 'bold';
            app.ZlimZmaxEditField_2Label.FontColor = [0.149 0.149 0.149];
            app.ZlimZmaxEditField_2Label.Position = [548 296 103 33];
            app.ZlimZmaxEditField_2Label.Text = 'Zlim Zmax';

            % Create ZlimZmaxEditField_2
            app.ZlimZmaxEditField_2 = uieditfield(app.YarnPathsTab, 'numeric');
            app.ZlimZmaxEditField_2.FontName = 'Times New Roman';
            app.ZlimZmaxEditField_2.FontSize = 15;
            app.ZlimZmaxEditField_2.FontWeight = 'bold';
            app.ZlimZmaxEditField_2.Position = [657 296 79 33];

            % Create ViewElevationEditField_2Label
            app.ViewElevationEditField_2Label = uilabel(app.YarnPathsTab);
            app.ViewElevationEditField_2Label.BackgroundColor = [0.9412 0.9412 0.9412];
            app.ViewElevationEditField_2Label.HorizontalAlignment = 'center';
            app.ViewElevationEditField_2Label.FontName = 'Times New Roman';
            app.ViewElevationEditField_2Label.FontSize = 15;
            app.ViewElevationEditField_2Label.FontWeight = 'bold';
            app.ViewElevationEditField_2Label.FontColor = [0.149 0.149 0.149];
            app.ViewElevationEditField_2Label.Position = [546 461 102 33];
            app.ViewElevationEditField_2Label.Text = 'View Elevation';

            % Create ViewElevationEditField_2
            app.ViewElevationEditField_2 = uieditfield(app.YarnPathsTab, 'numeric');
            app.ViewElevationEditField_2.FontName = 'Times New Roman';
            app.ViewElevationEditField_2.FontSize = 15;
            app.ViewElevationEditField_2.FontWeight = 'bold';
            app.ViewElevationEditField_2.Position = [654 461 79 33];

            % Create ZlimZminEditField_2Label
            app.ZlimZminEditField_2Label = uilabel(app.YarnPathsTab);
            app.ZlimZminEditField_2Label.BackgroundColor = [0.9412 0.9412 0.9412];
            app.ZlimZminEditField_2Label.FontName = 'Times New Roman';
            app.ZlimZminEditField_2Label.FontSize = 15;
            app.ZlimZminEditField_2Label.FontWeight = 'bold';
            app.ZlimZminEditField_2Label.FontColor = [0.149 0.149 0.149];
            app.ZlimZminEditField_2Label.Position = [548 378 103 33];
            app.ZlimZminEditField_2Label.Text = 'Zlim Zmin';

            % Create ZlimZminEditField_2
            app.ZlimZminEditField_2 = uieditfield(app.YarnPathsTab, 'numeric');
            app.ZlimZminEditField_2.FontName = 'Times New Roman';
            app.ZlimZminEditField_2.FontSize = 15;
            app.ZlimZminEditField_2.FontWeight = 'bold';
            app.ZlimZminEditField_2.Position = [657 378 79 33];

            % Create ViewAzimuthEditField_2Label
            app.ViewAzimuthEditField_2Label = uilabel(app.YarnPathsTab);
            app.ViewAzimuthEditField_2Label.BackgroundColor = [0.9412 0.9412 0.9412];
            app.ViewAzimuthEditField_2Label.HorizontalAlignment = 'center';
            app.ViewAzimuthEditField_2Label.FontName = 'Times New Roman';
            app.ViewAzimuthEditField_2Label.FontSize = 15;
            app.ViewAzimuthEditField_2Label.FontWeight = 'bold';
            app.ViewAzimuthEditField_2Label.FontColor = [0.149 0.149 0.149];
            app.ViewAzimuthEditField_2Label.Position = [547 539 98 33];
            app.ViewAzimuthEditField_2Label.Text = 'View Azimuth';

            % Create ViewAzimuthEditField_2
            app.ViewAzimuthEditField_2 = uieditfield(app.YarnPathsTab, 'numeric');
            app.ViewAzimuthEditField_2.FontName = 'Times New Roman';
            app.ViewAzimuthEditField_2.FontSize = 15;
            app.ViewAzimuthEditField_2.FontWeight = 'bold';
            app.ViewAzimuthEditField_2.Position = [654 539 79 33];

            % Create YarnNumbersEditField_2Label
            app.YarnNumbersEditField_2Label = uilabel(app.YarnPathsTab);
            app.YarnNumbersEditField_2Label.BackgroundColor = [0.9412 0.9412 0.9412];
            app.YarnNumbersEditField_2Label.FontName = 'Times New Roman';
            app.YarnNumbersEditField_2Label.FontSize = 15;
            app.YarnNumbersEditField_2Label.FontWeight = 'bold';
            app.YarnNumbersEditField_2Label.FontColor = [0.149 0.149 0.149];
            app.YarnNumbersEditField_2Label.Position = [549 215 103 33];
            app.YarnNumbersEditField_2Label.Text = 'Yarn Numbers';

            % Create YarnNumbersEditField_2
            app.YarnNumbersEditField_2 = uieditfield(app.YarnPathsTab, 'numeric');
            app.YarnNumbersEditField_2.FontName = 'Times New Roman';
            app.YarnNumbersEditField_2.FontSize = 15;
            app.YarnNumbersEditField_2.FontWeight = 'bold';
            app.YarnNumbersEditField_2.Position = [658 215 79 33];

            % Create FabricStructureTab
            app.FabricStructureTab = uitab(app.TabGroup);
            app.FabricStructureTab.Title = 'Fabric Structure';

            % Create UIAxes2_3
            app.UIAxes2_3 = uiaxes(app.FabricStructureTab);
            xlabel(app.UIAxes2_3, 'X')
            ylabel(app.UIAxes2_3, 'Y')
            zlabel(app.UIAxes2_3, 'Z')
            app.UIAxes2_3.FontName = 'Times New Roman';
            app.UIAxes2_3.FontWeight = 'bold';
            app.UIAxes2_3.FontSize = 15;
            app.UIAxes2_3.Position = [1 1 521 656];

            % Create FabricStructureCalculationButton
            app.FabricStructureCalculationButton = uibutton(app.FabricStructureTab, 'state');
            app.FabricStructureCalculationButton.ValueChangedFcn = createCallbackFcn(app, @FabricStructureCalculationButtonValueChanged, true);
            app.FabricStructureCalculationButton.IconAlignment = 'center';
            app.FabricStructureCalculationButton.Text = {'Fabric Structure'; ' Calculation'};
            app.FabricStructureCalculationButton.BackgroundColor = [0 0.4471 0.7412];
            app.FabricStructureCalculationButton.FontName = 'Times New Roman';
            app.FabricStructureCalculationButton.FontSize = 20;
            app.FabricStructureCalculationButton.FontWeight = 'bold';
            app.FabricStructureCalculationButton.FontColor = [1 1 1];
            app.FabricStructureCalculationButton.Position = [549 65 190 63];

            % Create ZlimZmaxEditField_3Label
            app.ZlimZmaxEditField_3Label = uilabel(app.FabricStructureTab);
            app.ZlimZmaxEditField_3Label.BackgroundColor = [0.9412 0.9412 0.9412];
            app.ZlimZmaxEditField_3Label.FontName = 'Times New Roman';
            app.ZlimZmaxEditField_3Label.FontSize = 15;
            app.ZlimZmaxEditField_3Label.FontWeight = 'bold';
            app.ZlimZmaxEditField_3Label.FontColor = [0.149 0.149 0.149];
            app.ZlimZmaxEditField_3Label.Position = [548 296 103 33];
            app.ZlimZmaxEditField_3Label.Text = 'Zlim Zmax';

            % Create ZlimZmaxEditField_3
            app.ZlimZmaxEditField_3 = uieditfield(app.FabricStructureTab, 'numeric');
            app.ZlimZmaxEditField_3.FontName = 'Times New Roman';
            app.ZlimZmaxEditField_3.FontSize = 15;
            app.ZlimZmaxEditField_3.FontWeight = 'bold';
            app.ZlimZmaxEditField_3.Position = [657 296 79 33];

            % Create ViewElevationEditField_3Label
            app.ViewElevationEditField_3Label = uilabel(app.FabricStructureTab);
            app.ViewElevationEditField_3Label.BackgroundColor = [0.9412 0.9412 0.9412];
            app.ViewElevationEditField_3Label.HorizontalAlignment = 'center';
            app.ViewElevationEditField_3Label.FontName = 'Times New Roman';
            app.ViewElevationEditField_3Label.FontSize = 15;
            app.ViewElevationEditField_3Label.FontWeight = 'bold';
            app.ViewElevationEditField_3Label.FontColor = [0.149 0.149 0.149];
            app.ViewElevationEditField_3Label.Position = [546 461 102 33];
            app.ViewElevationEditField_3Label.Text = 'View Elevation';

            % Create ViewElevationEditField_3
            app.ViewElevationEditField_3 = uieditfield(app.FabricStructureTab, 'numeric');
            app.ViewElevationEditField_3.FontName = 'Times New Roman';
            app.ViewElevationEditField_3.FontSize = 15;
            app.ViewElevationEditField_3.FontWeight = 'bold';
            app.ViewElevationEditField_3.Position = [654 461 79 33];

            % Create ZlimZminEditField_3Label
            app.ZlimZminEditField_3Label = uilabel(app.FabricStructureTab);
            app.ZlimZminEditField_3Label.BackgroundColor = [0.9412 0.9412 0.9412];
            app.ZlimZminEditField_3Label.FontName = 'Times New Roman';
            app.ZlimZminEditField_3Label.FontSize = 15;
            app.ZlimZminEditField_3Label.FontWeight = 'bold';
            app.ZlimZminEditField_3Label.FontColor = [0.149 0.149 0.149];
            app.ZlimZminEditField_3Label.Position = [548 378 103 33];
            app.ZlimZminEditField_3Label.Text = 'Zlim Zmin';

            % Create ZlimZminEditField_3
            app.ZlimZminEditField_3 = uieditfield(app.FabricStructureTab, 'numeric');
            app.ZlimZminEditField_3.FontName = 'Times New Roman';
            app.ZlimZminEditField_3.FontSize = 15;
            app.ZlimZminEditField_3.FontWeight = 'bold';
            app.ZlimZminEditField_3.Position = [657 378 79 33];

            % Create ViewAzimuthEditField_3Label
            app.ViewAzimuthEditField_3Label = uilabel(app.FabricStructureTab);
            app.ViewAzimuthEditField_3Label.BackgroundColor = [0.9412 0.9412 0.9412];
            app.ViewAzimuthEditField_3Label.HorizontalAlignment = 'center';
            app.ViewAzimuthEditField_3Label.FontName = 'Times New Roman';
            app.ViewAzimuthEditField_3Label.FontSize = 15;
            app.ViewAzimuthEditField_3Label.FontWeight = 'bold';
            app.ViewAzimuthEditField_3Label.FontColor = [0.149 0.149 0.149];
            app.ViewAzimuthEditField_3Label.Position = [547 539 98 33];
            app.ViewAzimuthEditField_3Label.Text = 'View Azimuth';

            % Create ViewAzimuthEditField_3
            app.ViewAzimuthEditField_3 = uieditfield(app.FabricStructureTab, 'numeric');
            app.ViewAzimuthEditField_3.FontName = 'Times New Roman';
            app.ViewAzimuthEditField_3.FontSize = 15;
            app.ViewAzimuthEditField_3.FontWeight = 'bold';
            app.ViewAzimuthEditField_3.Position = [654 539 79 33];

            % Create YarnNumbersEditFieldLabel
            app.YarnNumbersEditFieldLabel = uilabel(app.FabricStructureTab);
            app.YarnNumbersEditFieldLabel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.YarnNumbersEditFieldLabel.FontName = 'Times New Roman';
            app.YarnNumbersEditFieldLabel.FontSize = 15;
            app.YarnNumbersEditFieldLabel.FontWeight = 'bold';
            app.YarnNumbersEditFieldLabel.FontColor = [0.149 0.149 0.149];
            app.YarnNumbersEditFieldLabel.Position = [549 215 103 33];
            app.YarnNumbersEditFieldLabel.Text = 'Yarn Numbers';

            % Create YarnNumbersEditField
            app.YarnNumbersEditField = uieditfield(app.FabricStructureTab, 'numeric');
            app.YarnNumbersEditField.FontName = 'Times New Roman';
            app.YarnNumbersEditField.FontSize = 15;
            app.YarnNumbersEditField.FontWeight = 'bold';
            app.YarnNumbersEditField.Position = [658 215 79 33];

            % Create BraidingMachinePanel
            app.BraidingMachinePanel = uipanel(app.RightPanel);
            app.BraidingMachinePanel.Title = 'Braiding Machine';
            app.BraidingMachinePanel.BackgroundColor = [0.9412 0.9412 0.9412];
            app.BraidingMachinePanel.FontName = 'Times New Roman';
            app.BraidingMachinePanel.FontWeight = 'bold';
            app.BraidingMachinePanel.FontSize = 20;
            app.BraidingMachinePanel.Position = [5 713 771 70];

            % Create MatrixRowEditFieldLabel
            app.MatrixRowEditFieldLabel = uilabel(app.BraidingMachinePanel);
            app.MatrixRowEditFieldLabel.HorizontalAlignment = 'right';
            app.MatrixRowEditFieldLabel.FontName = 'Times New Roman';
            app.MatrixRowEditFieldLabel.FontSize = 15;
            app.MatrixRowEditFieldLabel.Position = [15 11 79 22];
            app.MatrixRowEditFieldLabel.Text = 'Matrix Row';

            % Create MatrixRowEditField
            app.MatrixRowEditField = uieditfield(app.BraidingMachinePanel, 'numeric');
            app.MatrixRowEditField.FontName = 'Times New Roman';
            app.MatrixRowEditField.FontSize = 15;
            app.MatrixRowEditField.Position = [109 11 100 22];

            % Create MatrixColumnEditFieldLabel
            app.MatrixColumnEditFieldLabel = uilabel(app.BraidingMachinePanel);
            app.MatrixColumnEditFieldLabel.HorizontalAlignment = 'right';
            app.MatrixColumnEditFieldLabel.FontName = 'Times New Roman';
            app.MatrixColumnEditFieldLabel.FontSize = 15;
            app.MatrixColumnEditFieldLabel.Position = [227 10 99 22];
            app.MatrixColumnEditFieldLabel.Text = 'Matrix Column';

            % Create MatrixColumnEditField
            app.MatrixColumnEditField = uieditfield(app.BraidingMachinePanel, 'numeric');
            app.MatrixColumnEditField.FontName = 'Times New Roman';
            app.MatrixColumnEditField.FontSize = 15;
            app.MatrixColumnEditField.Position = [341 10 100 22];

            % Create BraidingMechineButton
            app.BraidingMechineButton = uibutton(app.BraidingMachinePanel, 'push');
            app.BraidingMechineButton.ButtonPushedFcn = createCallbackFcn(app, @BraidingMechineButtonPushed, true);
            app.BraidingMechineButton.IconAlignment = 'bottom';
            app.BraidingMechineButton.WordWrap = 'on';
            app.BraidingMechineButton.BackgroundColor = [0 0.4471 0.7412];
            app.BraidingMechineButton.FontName = 'Times New Roman';
            app.BraidingMechineButton.FontSize = 15;
            app.BraidingMechineButton.FontWeight = 'bold';
            app.BraidingMechineButton.FontColor = [1 1 1];
            app.BraidingMechineButton.Position = [497 9 189 26];
            app.BraidingMechineButton.Text = 'Braiding Mechine';

            % Create successLamp
            app.successLamp = uilamp(app.BraidingMachinePanel);
            app.successLamp.Position = [716 5 36 36];
            app.successLamp.Color = [1 0 0];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = BSSAappV01_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end