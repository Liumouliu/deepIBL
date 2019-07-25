% Define a starting folder.
start_path = '/media/liu/6TB/liu/dataset/247/images';

allSubFolders = genpath(start_path);
% Parse into a cell array.
remain = allSubFolders;
listOfFolderNames = {};
while true
	[singleSubFolder, remain] = strtok(remain, ':');
	if isempty(singleSubFolder)
		break;
	end
	listOfFolderNames = [listOfFolderNames singleSubFolder];
end
numberOfFolders = length(listOfFolderNames)

% Process all image files in those folders.
for k = 1 : numberOfFolders
	% Get this folder and print it out.
	thisFolder = listOfFolderNames{k};
	fprintf('Processing folder %s\n', thisFolder);
	
	% Get PNG files.
	filePattern = sprintf('%s/*.png', thisFolder);
	baseFileNames = dir(filePattern);

	numberOfImageFiles = length(baseFileNames);
	% Now we have a list of all files in this folder.
	
	if numberOfImageFiles >= 1
		% Go through all those image files.
		for f = 1 : numberOfImageFiles
			fullFileName = fullfile(thisFolder, baseFileNames(f).name);
            temp = imread(fullFileName);
            fullFileName(end-3:end) = '.jpg';
            imwrite(temp,fullFileName,'jpg','Quality',100);

			fprintf('     Processing image file %s\n', fullFileName);
		end
	else
		fprintf('     Folder %s has no image files in it.\n', thisFolder);
	end
end