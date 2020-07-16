source_dir = getDirectory("Choose Source Directory");
normal_color_dir = getDirectory("Choose Destination Directory For Normal Color Strawberries");
light_color_dir = getDirectory("Choose Destination Directory For Light Color Strawberries");
row_strawberries_list = getFileList(source_dir);

setBatchMode(true);

for (i=0; i<row_strawberries_list.length; i++) 
{

    showProgress(i+1, row_strawberries_list.length);

    filename = source_dir + row_strawberries_list[i];

    if (endsWith(filename, "JPG")) 
    {
    
        open(filename);

        run("Apply saved SIOX segmentator", "browse=[D:\segmentation\normalColor.siox] siox=[D:\segmentation\normalColor.siox]");

        saveAs("JPEG",  normal_color_dir + "normal_" + row_strawberries_list[i]);
        
        run("Apply saved SIOX segmentator", "browse=[D:\segmentation\lightColor.siox] siox=[D:\segmentation\lightColor.siox]");
        
        saveAs("JPEG", light_color_dir + "light_" + row_strawberries_list[i]);

        run("Close");

close();
}
}

setBatchMode(false);
