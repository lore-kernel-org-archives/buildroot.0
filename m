From: Roman Bigler <roeme@roeme.ch>
Date: Thu, 8 May 2008 16:51:44 +0200
Subject: [Buildroot] Python package broken, Trying to fix, Need hints.
Message-ID: <A5E553DC-19FF-4F4E-817E-996DA88B2858@roeme.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello List,

in the last two days I've tried to use the python package, however, it  
fails to build.
The build process barfs the following at me:
<snip>
make[1]: Leaving directory `/home/roeme/minim/buildroot/buildroot/ 
build_i586/Python-2.4.2'
/bin/sh: line 8: -/usr/bin/make: No such file or directory
make: *** [/home/roeme/minim/buildroot/buildroot/build_i586/ 
Python-2.4.2/.hostpython] Error 127
<snap>

The error is reproduceable.

I tried the follow so far, with no luck:
- disabling all python modules
- disabling some python modules
- make distclean; make
- creating a python package from scratch (by using this doc: http://buildroot.uclibc.org/buildroot.html#add_software) 
,
   this brought other errors, so I bailed out on that.

I filed a bugreport (#3274, see http://bugs.busybox.net/view.php? 
id=3274 ) and since I'm
in a thight schedule, set out to fix it by myself, despite being a  
bloody novice.

- Does it take less effort to create a new package instead of fixing  
the current one?
- If yes, can somebody give me some hints which files to look at/into  
to fix it?
- If I can help out with anything else, please let me know.

Thanks in advance for any help!
