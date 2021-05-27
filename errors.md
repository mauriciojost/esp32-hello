
# Error 1

bash build_llvm.sh

In file included from /usr/include/libxml2/libxml/parser.h:810,
                 from /usr/include/libxml2/libxml/globals.h:18,
                 from /usr/include/libxml2/libxml/threads.h:35,
                 from /usr/include/libxml2/libxml/xmlmemory.h:218,
                 from /usr/include/libxml2/libxml/tree.h:1307,
                 from /usr/include/libxml2/libxml/xmlreader.h:14,
                 from /home/mjost/.xtensa/llvm-xtensa/lib/WindowsManifest/WindowsManifestMerger.cpp:21:
/usr/include/libxml2/libxml/encoding.h:31:10: fatal error: unicode/ucnv.h: No such file or directory
   31 | #include <unicode/ucnv.h>
      |          ^~~~~~~~~~~~~~~~
compilation terminated.
[1172/2430] Building CXX object lib/Testing/Support/CMakeFiles/LLVMTestingSupport.dir/Error.cpp.o
In file included from /home/mjost/.xtensa/llvm-xtensa/utils/unittest/googlemock/include/gmock/gmock-spec-builders.h:75,
                 from /home/mjost/.xtensa/llvm-xtensa/utils/unittest/googlemock/include/gmock/gmock-generated-function-mockers.h:43,
                 from /home/mjost/.xtensa/llvm-xte


solution ==> add icu python package to virtual env
