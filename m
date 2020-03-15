From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Mar 2020 11:32:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/thrift: disable qt for host
 build
In-Reply-To: <20200306220129.1149054-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 6 Mar 2020 23:01:29 +0100")
References: <20200306220129.1149054-1-fontaine.fabrice@gmail.com>
Message-ID: <87tv2plxhm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > host-thrift can fail if a broken Qt4 is found on host:
 > CMake Error in lib/cpp/CMakeLists.txt:
 >   Imported target "Qt4::QtCore" includes non-existent path

 >     "/nvmedata/autobuild/instance-4/output-1/host/usr/mkspecs/default"

 >   in its INTERFACE_INCLUDE_DIRECTORIES.  Possible reasons include:

 >   * The path was deleted, renamed, or moved to another location.

 >   * An install or uninstall procedure did not complete successfully.

 >   * The installation package was faulty and references files it does not
 >   provide.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/57cad5313896c868e99b0b9534678f1c83a386f2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
