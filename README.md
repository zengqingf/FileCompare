# FileCompare
####用OC写的一个多文件比较的工具
通常在一个目录下有很多文件和目录，假设有人修改了其中一个文件，而我们需要找到这个修改过的文件，人工从成百上千个文件中寻找一个修改过的文件无疑大海捞针，所以特做此工具比对出差异文件
#### Tips
使用方法:

	NSString *pathA = @"/Users/zengqingfu/pathA/";
    NSString *pathB = @"/Users/zengqingfu/pathB/";
    [Util compareFilesWithPathA:pathA pathB:pathB]; 
    
 * 代码会递归扫描pathA路径下的所有文件，然后对比pathB相同目录下的文件的md5，如果md5相同则认为文件相同，否则不同。
 * 如果pathA下的文件在pathB中不存在，那么程序依旧会认为文件差异，并打印
 * 如果pathB下的文件在pathA中不存在,程序不会打印差异，因为程序是按照pathA的目录下遍历整个文件夹的
