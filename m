From: Vellemans, Noel <Noel.Vellemans@visionBMS.com>
Date: Mon, 5 Nov 2012 10:18:20 +0100
Subject: [Buildroot] mesa3d:  "ImportError: No module named libxml2"
Message-ID: <1531E53627F1F749B4FE809BF2A4EB6703A24FFD@wetmex10>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I've been test running/building a recent buildroot (git-version).. 

I do end up with this error while building mesa3d"  "ImportError: No
module named libxml2" (ONLY if I do build into a clean-output
directory!)

The strange thing is that when building for a second time it all builds
fine.
 
Any clue where to look at? 
 
Regards Noel.

LOG: 
 
Traceback (most recent call last):
  File "main/es_generator.py", line 26, in <module>
    import APIspecutil as apiutil
Traceback (most recent call last):
  File "main/es_generator.py", line 26, in <module>
  File
"/data1/buildhome/20120420/latest_git/20121015_git/buildroot/imx537/du8p
e/build/mesa3d-7.10.1/src/mesa/main/APIspecutil.py", line 28, in
<module>
    import APIspecutil as apiutil
    import libxml2
  File
"/data1/buildhome/20120420/latest_git/20121015_git/buildroot/imx537/du8p
e/build/mesa3d-7.10.1/src/mesa/main
    import libxml2
ImportError: No module named libxml2
make[3]: *** No rule to make target `main/api_exec_es1.c', needed by
`depend'.  Stop.
