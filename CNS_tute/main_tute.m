%initial HCTSA from data file
TS_Init('INP_Bonn_EEG.mat');
%create hctsa working file
TS_Compute();
%remove any bad features n series
TS_Normalize();
%label for classificiation using keywords
TS_LabelGroups('norm');
%cluster series based on feature values and plot matrix
TS_Cluster();
TS_PlotDataMatrix('norm');
%plot a projection
TS_PlotLowDim('norm','pca');
%set up params for classification, can be editted as required
cfnParams = GiveMeDefaultClassificationParams('norm');
TellMeAboutClassification(cfnParams);
%perform classification as specified by cfnParams
TS_Classify('norm');

cfnParams.numRepeats = 5;
%test results using different features
TS_CompareFeatureSets('norm',cfnParams);
%test results w low dim projections
TS_ClassifyLowDim('norm');
%find your best features, their relationship, and what they're good at
TS_TopFeatures('norm','classification');
%in depth look at specific feature, using ID
TS_FeatureSummary(95,'raw')