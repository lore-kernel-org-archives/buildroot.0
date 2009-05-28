From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 28 May 2009 19:24:27 +0000 (UTC)
Subject: [Buildroot] [Bug 355] New: Please update WebKit - it doesn't
	compile!
Message-ID: <bug-355-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=355

              Host: i386-pc-linux-gnu
            Target: i386-pc-linux-uclibc
             Build: i386-pc-linux-uclibc
           Summary: Please update WebKit - it doesn't compile!
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: dandart at googlemail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I get an error while trying to compile WebKit, it may be due to the fact it is
r31321. It and midori really need updating.


/home/dan/Desktop/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-g++
-Os -pipe -Os -I/home/dan/Desktop/buildroot/build_i386/staging_dir/usr/include
-I/home/dan/Desktop/buildroot/build_i386/staging_dir/include
--sysroot=/home/dan/Desktop/buildroot/build_i386/staging_dir/ -isysroot
/home/dan/Desktop/buildroot/build_i386/staging_dir -mtune=i386 -march=i386
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DHAVE_CONFIG_H -I. -DWTF_USE_ICU_UNICODE=1 -DBUILDING_GTK__=1 -DWTF_CHANGES
-DXP_UNIX -DNDEBUG -DENABLE_ICONDATABASE=0 -I./JavaScriptCore
-I./JavaScriptCore/ForwardingHeaders -I./JavaScriptCore/wtf
-I./JavaScriptCore/kjs -I./DerivedSources -I./JavaScriptCore/ForwardingHeaders
-I./JavaScriptCore/wtf/unicode -I./JavaScriptCore/pcre -I./JavaScriptCore/kjs
-fvisibility-inlines-hidden -fno-rtti -Wall -W -Wcast-align -Wchar-subscripts
-Wreturn-type -Wformat -Wformat-security -Wno-format-y2k -Wundef
-Wmissing-format-attribute -Wpointer-arith -Wwrite-strings
-Wno-unused-parameter -fno-exceptions -fvisibility=hidden -pthread
-I/home/dan/Desktop/buildroot/build_i386/staging_dir/usr/include/glib-2.0
-I/home/dan/Desktop/buildroot/build_i386/staging_dir/usr/lib/glib-2.0/include
-D_REENTRANT -I/home/dan/Desktop/buildroot/build_i386/staging_dir/usr/include
-fstrict-aliasing -Os -pipe -Os
-I/home/dan/Desktop/buildroot/build_i386/staging_dir/usr/include
-I/home/dan/Desktop/buildroot/build_i386/staging_dir/include
--sysroot=/home/dan/Desktop/buildroot/build_i386/staging_dir/ -isysroot
/home/dan/Desktop/buildroot/build_i386/staging_dir -mtune=i386 -march=i386
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -MT
JavaScriptCore/wtf/unicode/icu/libJavaScriptCore_la-CollatorICU.lo -MD -MP -MF
JavaScriptCore/wtf/unicode/icu/.deps/libJavaScriptCore_la-CollatorICU.Tpo -c
JavaScriptCore/wtf/unicode/icu/CollatorICU.cpp  -fPIC -DPIC -o
JavaScriptCore/wtf/unicode/icu/.libs/libJavaScriptCore_la-CollatorICU.o
JavaScriptCore/wtf/unicode/icu/CollatorICU.cpp: In constructor
'WTF::Collator::Collator(const char*)':
JavaScriptCore/wtf/unicode/icu/CollatorICU.cpp:53: error: 'strdup' was not
declared in this scope
JavaScriptCore/wtf/unicode/icu/CollatorICU.cpp: In member function 'void
WTF::Collator::createCollator() const':
JavaScriptCore/wtf/unicode/icu/CollatorICU.cpp:110: error: 'strcmp' was not
declared in this scope
make[2]: ***
[JavaScriptCore/wtf/unicode/icu/libJavaScriptCore_la-CollatorICU.lo] Error 1
make[2]: *** Waiting for unfinished jobs....

/home/dan/Desktop/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-g++
-Os -pipe -Os -I/home/dan/Desktop/buildroot/build_i386/staging_dir/usr/include
-I/home/dan/Desktop/buildroot/build_i386/staging_dir/include
--sysroot=/home/dan/Desktop/buildroot/build_i386/staging_dir/ -isysroot
/home/dan/Desktop/buildroot/build_i386/staging_dir -mtune=i386 -march=i386
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DHAVE_CONFIG_H -I. -DWTF_USE_ICU_UNICODE=1 -DBUILDING_GTK__=1 -DWTF_CHANGES
-DXP_UNIX -DNDEBUG -DENABLE_ICONDATABASE=0 -I./JavaScriptCore
-I./JavaScriptCore/ForwardingHeaders -I./JavaScriptCore/wtf
-I./JavaScriptCore/kjs -I./DerivedSources -I./JavaScriptCore/ForwardingHeaders
-I./JavaScriptCore/wtf/unicode -I./JavaScriptCore/pcre -I./JavaScriptCore/kjs
-fvisibility-inlines-hidden -fno-rtti -Wall -W -Wcast-align -Wchar-subscripts
-Wreturn-type -Wformat -Wformat-security -Wno-format-y2k -Wundef
-Wmissing-format-attribute -Wpointer-arith -Wwrite-strings
-Wno-unused-parameter -fno-exceptions -fvisibility=hidden -pthread
-I/home/dan/Desktop/buildroot/build_i386/staging_dir/usr/include/glib-2.0
-I/home/dan/Desktop/buildroot/build_i386/staging_dir/usr/lib/glib-2.0/include
-D_REENTRANT -I/home/dan/Desktop/buildroot/build_i386/staging_dir/usr/include
-fstrict-aliasing -Os -pipe -Os
-I/home/dan/Desktop/buildroot/build_i386/staging_dir/usr/include
-I/home/dan/Desktop/buildroot/build_i386/staging_dir/include
--sysroot=/home/dan/Desktop/buildroot/build_i386/staging_dir/ -isysroot
/home/dan/Desktop/buildroot/build_i386/staging_dir -mtune=i386 -march=i386
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -MT
JavaScriptCore/kjs/libJavaScriptCore_la-AllInOneFile.lo -MD -MP -MF
JavaScriptCore/kjs/.deps/libJavaScriptCore_la-AllInOneFile.Tpo -c
JavaScriptCore/kjs/AllInOneFile.cpp  -fPIC -DPIC -o
JavaScriptCore/kjs/.libs/libJavaScriptCore_la-AllInOneFile.o
In file included from JavaScriptCore/kjs/SymbolTable.h:32,
                 from JavaScriptCore/kjs/JSVariableObject.h:33,
                 from JavaScriptCore/kjs/function.h:28,
                 from JavaScriptCore/kjs/function.cpp:27,
                 from JavaScriptCore/kjs/AllInOneFile.cpp:28:
JavaScriptCore/kjs/ustring.h:283: warning: type qualifiers ignored on function
return type
In file included from JavaScriptCore/kjs/function.cpp:47,
                 from JavaScriptCore/kjs/AllInOneFile.cpp:28:
./JavaScriptCore/wtf/ASCIICType.h: In function 'bool
WTF::isASCIIAlphanumeric(char)':
./JavaScriptCore/wtf/ASCIICType.h:53: warning: suggest parentheses around &&
within ||
./JavaScriptCore/wtf/ASCIICType.h: In function 'bool
WTF::isASCIIAlphanumeric(short unsigned int)':
./JavaScriptCore/wtf/ASCIICType.h:54: warning: suggest parentheses around &&
within ||
./JavaScriptCore/wtf/ASCIICType.h: In function 'bool
WTF::isASCIIAlphanumeric(wchar_t)':
./JavaScriptCore/wtf/ASCIICType.h:56: warning: suggest parentheses around &&
within ||
./JavaScriptCore/wtf/ASCIICType.h: In function 'bool
WTF::isASCIIAlphanumeric(int)':
./JavaScriptCore/wtf/ASCIICType.h:58: warning: suggest parentheses around &&
within ||
./JavaScriptCore/wtf/ASCIICType.h: In function 'bool
WTF::isASCIIHexDigit(char)':
./JavaScriptCore/wtf/ASCIICType.h:67: warning: suggest parentheses around &&
within ||
./JavaScriptCore/wtf/ASCIICType.h: In function 'bool WTF::isASCIIHexDigit(short
unsigned int)':
./JavaScriptCore/wtf/ASCIICType.h:68: warning: suggest parentheses around &&
within ||
./JavaScriptCore/wtf/ASCIICType.h: In function 'bool
WTF::isASCIIHexDigit(wchar_t)':
./JavaScriptCore/wtf/ASCIICType.h:70: warning: suggest parentheses around &&
within ||
./JavaScriptCore/wtf/ASCIICType.h: In function 'bool
WTF::isASCIIHexDigit(int)':
./JavaScriptCore/wtf/ASCIICType.h:72: warning: suggest parentheses around &&
within ||
In file included from JavaScriptCore/kjs/AllInOneFile.cpp:33:
JavaScriptCore/kjs/collector.cpp: In function 'void*
KJS::currentThreadStackBase()':
JavaScriptCore/kjs/collector.cpp:342: error: 'pthread_getattr_np' was not
declared in this scope
In file included from JavaScriptCore/kjs/AllInOneFile.cpp:40:
JavaScriptCore/kjs/dtoa.cpp: In function 'double b2d(Bigint*, int*)':
JavaScriptCore/kjs/dtoa.cpp:1003: warning: suggest parentheses around + or -
inside shift
JavaScriptCore/kjs/dtoa.cpp:1005: warning: suggest parentheses around + or -
inside shift
JavaScriptCore/kjs/dtoa.cpp:1005: warning: suggest parentheses around + or -
inside shift
JavaScriptCore/kjs/dtoa.cpp:1010: warning: suggest parentheses around + or -
inside shift
JavaScriptCore/kjs/dtoa.cpp:1012: warning: suggest parentheses around + or -
inside shift
JavaScriptCore/kjs/dtoa.cpp: In function 'Bigint* d2b(double, int*, int*)':
JavaScriptCore/kjs/dtoa.cpp:1082: warning: suggest parentheses around + or -
inside shift
JavaScriptCore/kjs/dtoa.cpp: In function 'double kjs_strtod(const char*,
char**)':
JavaScriptCore/kjs/dtoa.cpp:1655: warning: suggest parentheses around + or -
inside shift
JavaScriptCore/kjs/dtoa.cpp: In function 'char* kjs_dtoa(double, int, int,
int*, int*, char**)':
JavaScriptCore/kjs/dtoa.cpp:2487: warning: suggest parentheses around + or -
inside shift
JavaScriptCore/kjs/dtoa.cpp:2487: warning: suggest parentheses around + or -
inside shift
JavaScriptCore/kjs/dtoa.cpp:2488: warning: suggest parentheses around + or -
inside shift
JavaScriptCore/kjs/dtoa.cpp:2712: warning: suggest parentheses around && within
||
JavaScriptCore/kjs/dtoa.cpp:2882: warning: suggest parentheses around && within
||
JavaScriptCore/kjs/dtoa.cpp:2904: warning: suggest parentheses around && within
||
JavaScriptCore/kjs/dtoa.cpp:2964: warning: suggest parentheses around && within
||
In file included from JavaScriptCore/kjs/AllInOneFile.cpp:51:
JavaScriptCore/kjs/lexer.cpp: In static member function 'static bool
KJS::Lexer::isHexDigit(int)':
JavaScriptCore/kjs/lexer.cpp:624: warning: suggest parentheses around && within
||
JavaScriptCore/kjs/lexer.cpp:625: warning: suggest parentheses around && within
||
In file included from JavaScriptCore/kjs/AllInOneFile.cpp:69:
JavaScriptCore/kjs/ustring.cpp: At global scope:
JavaScriptCore/kjs/ustring.cpp:61: warning: type qualifiers ignored on function
return type
JavaScriptCore/kjs/ustring.cpp:62: warning: type qualifiers ignored on function
return type
JavaScriptCore/kjs/ustring.cpp:936: warning: type qualifiers ignored on
function return type
make[2]: *** [JavaScriptCore/kjs/libJavaScriptCore_la-AllInOneFile.lo] Error 1
make[2]: Leaving directory
`/home/dan/Desktop/buildroot/build_i386/webkit-r31321'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/dan/Desktop/buildroot/build_i386/webkit-r31321'
make: *** [/home/dan/Desktop/buildroot/build_i386/webkit-r31321/.stamp_built]
Error 2


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
