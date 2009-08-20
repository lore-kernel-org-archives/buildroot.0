From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 20 Aug 2009 16:11:23 +0000 (UTC)
Subject: [Buildroot] [Bug 575] Buildroot Libtool Patch Fails
In-Reply-To: <bug-575-163@https.bugs.busybox.net/>
References: <bug-575-163@https.bugs.busybox.net/>
Message-ID: <20090820161123.A41C777719@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=575





--- Comment #5 from Dan Dart <dandart@googlemail.com>  2009-08-20 16:11:22 UTC ---
Then it should select it. Done now and now getting JS compilation errors.

In file included from JavaScriptCore/AllInOneFile.cpp:47:                       
JavaScriptCore/runtime/Collector.cpp: In function ?void*
JSC::currentThreadStackBase()?:                                               
JavaScriptCore/runtime/Collector.cpp:451: error: ?pthread_getattr_np? was
not declared in this scope                                                      
mv -f WebCore/accessibility/.deps/libWebCore_la-AccessibilityList.Tpo
WebCore/accessibility/.deps/libWebCore_la-AccessibilityList.Plo                 
./doltlibtool --tag=CXX   --mode=compile
/home/dan/xenon/buildroot/build_i386/staging_dir/usr/bin/i386-linux-uclibc-g++
-Os -pipe -Os  -I/home/dan/xenon/buildroot/build_i386/staging_dir/usr/include
-I/home/dan/xenon/buildroot/build_i386/staging_dir/include
--sysroot=/home/dan/xenon/buildroot/build_i386/staging_dir/ -isysroot
/home/dan/xenon/buildroot/build_i386/staging_dir -mtune=i386 -march=i386
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-DHAVE_CONFIG_H -I.  -DBUILDING_CAIRO__=1 -DBUILDING_GTK__=1 -DWTF_CHANGES
-DWTF_USE_ICU_UNICODE=1   -DNDEBUG  -I./WebCore -I./WebCore/accessibility
-I./WebCore/bindings/js -I./WebCore/bridge -I./WebCore/bridge/c -I./WebCore/css
-I./WebCore/dom -I./WebCore/editing -I./WebCore/history -I./WebCore/html
-I./WebCore/inspector -I./WebCore/loader -I./WebCore/loader/appcache
-I./WebCore/loader/archive -I./WebCore/loader/icon -I./WebCore/page
-I./WebCore/page/animation -I./WebCore/platform -I./WebCore/platform/animation
-I./WebCore/platform/graphics -I./WebCore/platform/graphics/filters
-I./WebCore/platform/graphics/transforms -I./WebCore/platform/image-decoders
-I./WebCore/platform/image-decoders/bmp -I./WebCore/platform/image-decoders/gif
-I./WebCore/platform/image-decoders/ico
-I./WebCore/platform/image-decoders/jpeg
-I./WebCore/platform/image-decoders/png -I./WebCore/platform/image-decoders/xbm
-I./WebCore/platform/network -I./WebCore/platform/text -I./WebCore/plugins
-I./WebCore/rendering -I./WebCore/rendering/style -I./WebCore/workers
-I./WebCore/xml -I./WebCore/bindings/js -DDATA_DIR=\"/usr/share\"
-DENABLE_JAVASCRIPT_DEBUGGER=1 -DENABLE_OFFLINE_WEB_APPLICATIONS=1
-DENABLE_DASHBOARD_SUPPORT=1 -DENABLE_DATABASE=1 -I./WebCore/platform/sql
-I./WebCore/storage  -DENABLE_DOM_STORAGE=1 -I./WebCore/storage
-DENABLE_ICONDATABASE=1    -DENABLE_XPATH=1 -DENABLE_XSLT=1 -DENABLE_WORKERS=1 
  -DENABLE_SVG=1 -I./WebCore/svg -I./WebCore/svg/animation
-I./WebCore/svg/graphics -I./WebCore/svg/graphics/filters -DENABLE_SVG_USE=1
-DENABLE_SVG_FOREIGN_OBJECT=1 -DENABLE_SVG_FONTS=1 -DENABLE_SVG_AS_IMAGE=1
-DENABLE_SVG_ANIMATION=1  -DWTF_USE_SOUP=1
-DENABLE_PLUGIN_PACKAGE_SIMPLE_HASH=1 -I./WebCore/accessibility/gtk
-I./WebCore/loader/gtk -I./WebCore/page/gtk -I./WebCore/platform/graphics/cairo
-I./WebCore/platform/graphics/gtk -I./WebCore/platform/gtk
-I./WebCore/platform/network/soup -DUSE_FREETYPE=1 
-I./JavaScriptCore/ForwardingHeaders -I./JavaScriptCore/parser
-I./JavaScriptCore/wtf -I./DerivedSources -I./JavaScriptCore
-I./JavaScriptCore/API -I./JavaScriptCore/ForwardingHeaders
-I./JavaScriptCore/interpreter -I./JavaScriptCore/bytecode
-I./JavaScriptCore/bytecompiler -I./JavaScriptCore/debugger
-I./JavaScriptCore/jit -I./JavaScriptCore/pcre -I./JavaScriptCore/profiler
-I./JavaScriptCore/runtime -I./JavaScriptCore/wrec -I./JavaScriptCore/jit
-I./JavaScriptCore/assembler -I./JavaScriptCore/wtf/unicode
-I./JavaScriptCore/yarr -I./JavaScriptCore/pcre -I./JavaScriptCore/parser
-I./JavaScriptCore/runtime   -Wall -W -Wcast-align -Wchar-subscripts
-Wreturn-type -Wformat -Wformat-security -Wno-format-y2k -Wundef
-Wmissing-format-attribute -Wpointer-arith -Wwrite-strings
-Wno-unused-parameter -Wno-parentheses -fno-exceptions -fvisibility=hidden
-fvisibility-inlines-hidden -fno-rtti -fno-strict-aliasing 
-I/home/dan/xenon/buildroot/build_i386/staging_dir/usr/include/enchant
-I/home/dan/xenon/buildroot/build_i386/staging_dir/usr/include/glib-2.0
-I/home/dan/xenon/buildroot/build_i386/staging_dir/usr/lib/glib-2.0/include   
-pthread
-I/home/dan/xenon/buildroot/build_i386/staging_dir/usr/include/glib-2.0
-I/home/dan/xenon/buildroot/build_i386/staging_dir/usr/lib/glib-2.0/include    
-D_REENTRANT
-I/home/dan/xenon/buildroot/build_i386/staging_dir/usr/include/gtk-2.0
-I/home/dan/xenon/buildroot/build_i386/staging_dir/usr/lib/gtk-2.0/include
-I/home/dan/xenon/buildroot/build_i386/staging_dir/home/dan/xenon/buildroot/build_i386/staging_dir/usr/include/cairo
-I/home/dan/xenon/buildroot/build_i386/staging_dir/home/dan/xenon/buildroot/build_i386/staging_dir/usr/include/directfb
-I/home/dan/xenon/buildroot/build_i386/staging_dir/home/dan/xenon/buildroot/build_i386/staging_dir/usr/include/freetype2
-I/home/dan/xenon/buildroot/build_i386/staging_dir/home/dan/xenon/buildroot/build_i386/staging_dir/usr/include/pixman-1
-I/home/dan/xenon/buildroot/build_i386/staging_dir/usr/include/atk-1.0
-I/home/dan/xenon/buildroot/build_i386/staging_dir/usr/include/cairo
-I/home/dan/xenon/buildroot/build_i386/staging_dir/usr/include/pango-1.0
-I/home/dan/xenon/buildroot/build_i386/staging_dir/usr/include/glib-2.0
-I/home/dan/xenon/buildroot/build_i386/staging_dir/usr/lib/glib-2.0/include
-I/home/dan/xenon/buildroot/build_i386/staging_dir/usr/include/freetype2
-I/home/dan/xenon/buildroot/build_i386/staging_dir/usr/include/directfb
-I/home/dan/xenon/buildroot/build_i386/staging_dir/usr/include/pixman-1   
-I/home/dan/xenon/buildroot/build_i386/staging_dir/usr/include/libsoup-2.4
-I/home/dan/xenon/buildroot/build_i386/staging_dir/usr/include/libxml2
-I/home/dan/xenon/buildroot/build_i386/staging_dir/usr/include/glib-2.0
-I/home/dan/xenon/buildroot/build_i386/staging_dir/usr/lib/glib-2.0/include  
-I/home/dan/xenon/buildroot/build_i386/staging_dir/usr/include/libxml2  
-I/home/dan/xenon/buildroot/build_i386/staging_dir/usr/include/libxml2   
-D_REENTRANT -I/home/dan/xenon/buildroot/build_i386/staging_dir/usr/include 
-Os -pipe -Os  -I/home/dan/xenon/buildroot/build_i386/staging_dir/usr/include
-I/home/dan/xenon/buildroot/build_i386/staging_dir/include
--sysroot=/home/dan/xenon/buildroot/build_i386/staging_dir/ -isysroot
/home/dan/xenon/buildroot/build_i386/staging_dir -mtune=i386 -march=i386
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -O2 -MT
WebCore/accessibility/libWebCore_la-AccessibilityListBox.lo -MD -MP -MF
WebCore/accessibility/.deps/libWebCore_la-AccessibilityListBox.Tpo -c -o
WebCore/accessibility/libWebCore_la-AccessibilityListBox.lo `test -f
'WebCore/accessibility/AccessibilityListBox.cpp' || echo
'./'`WebCore/accessibility/AccessibilityListBox.cpp
make[2]: *** [JavaScriptCore/libJavaScriptCore_la-AllInOneFile.lo] Error 1
make[2]: *** Waiting for unfinished jobs....
mv -f WebCore/accessibility/.deps/libWebCore_la-AccessibilityListBox.Tpo
WebCore/accessibility/.deps/libWebCore_la-AccessibilityListBox.Plo
make[2]: Leaving directory `/home/dan/xenon/buildroot/build_i386/webkit-r44552'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/dan/xenon/buildroot/build_i386/webkit-r44552'
make: *** [/home/dan/xenon/buildroot/build_i386/webkit-r44552/.stamp_built]
Error 2


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
