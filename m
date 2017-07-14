From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Fri, 14 Jul 2017 13:38:43 -0400
Subject: [Buildroot] [RFC 1/3] qt5webengine: new package
In-Reply-To: <1500038818129-170885.post@n4.nabble.com>
References: <20170322181331.23500-1-gael.portay@savoirfairelinux.com>
 <20170322181331.23500-2-gael.portay@savoirfairelinux.com>
 <20170418160420.jhdzh2emcbuk7ef7@gportay>
 <1495503976238-165475.post@n4.nabble.com>
 <1498803551220-168692.post@n4.nabble.com>
 <20170704183945.bnib6pizuriqkyds@gportay>
 <DM5PR03MB29247C6B28F4470FA8F36098BFAA0@DM5PR03MB2924.namprd03.prod.outlook.com>
 <20170707185801.zcyfwym74qatb3bl@gportay>
 <1499510931955-170362.post@n4.nabble.com>
 <1500038818129-170885.post@n4.nabble.com>
Message-ID: <20170714173843.hw5gsndni4hjjudp@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi gomsis,

Thanks you for the report.

On Fri, Jul 14, 2017 at 06:26:58AM -0700, gomsis wrote:
> error while compiling  
> 
>   File "../build/scripts/rule_bison.py", line 83, in <module>
>     returnCode = subprocess.call([bisonExe, '-d', '-p', prefix, inputFile,
> '-o', outputCpp])
>   File
> "/home/osboxes/Desktop/buildrootl/output/host/usr/lib/python2.7/subprocess.py",
> line 168, in call
>     return Popen(*popenargs, **kwargs).wait()
>   File
> "/home/osboxes/Desktop/buildrootl/output/host/usr/lib/python2.7/subprocess.py",
> line 390, in __init__
>     errread, errwrite)
>   File
> "/home/osboxes/Desktop/buildrootl/output/host/usr/lib/python2.7/subprocess.py",
> line 1024, in _execute_child
>     raise child_exception
> OSError: [Errno 2] No such file or directory
> [2/9493] ACTION Caching PLY lex & yacc lex/parse tables
> ninja: build stopped: subcommand failed.
> Makefile.gyp_run:317: recipe for target 'invoke_ninja' failed
> make[4]: *** [invoke_ninja] Error 1
> make[4]: Leaving directory
> '/home/osboxes/Desktop/buildrootl/output/build/qt5webengine-5.8.0/src/core'
> Makefile:116: recipe for target 'sub-gyp_run-pro-make_first' failed
> make[3]: *** [sub-gyp_run-pro-make_first] Error 2
> make[3]: Leaving directory
> '/home/osboxes/Desktop/buildrootl/output/build/qt5webengine-5.8.0/src/core'
> Makefile:49: recipe for target 'sub-core-make_first' failed
> make[2]: *** [sub-core-make_first] Error 2
> make[2]: Leaving directory
> '/home/osboxes/Desktop/buildrootl/output/build/qt5webengine-5.8.0/src'
> Makefile:44: recipe for target 'sub-src-make_first' failed
> make[1]: *** [sub-src-make_first] Error 2
> make[1]: Leaving directory
> '/home/osboxes/Desktop/buildrootl/output/build/qt5webengine-5.8.0'
> package/pkg-generic.mk:227: recipe for target
> '/home/osboxes/Desktop/buildrootl/output/build/qt5webengine-5.8.0/.stamp_built'
> failed
> make: ***
> [/home/osboxes/Desktop/buildrootl/output/build/qt5webengine-5.8.0/.stamp_built]
> Error 2
> 
> 

I have never met this error before. I have tested ony on RPI 3.

Which target are you building Qt WE for?

Regards,
Ga?l
