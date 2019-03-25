From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 25 Mar 2019 17:24:16 +0100
Subject: [Buildroot] [PATCH v2,1/1] package/mongodb: needs host-python2
In-Reply-To: <20190308194411.8573-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 8 Mar 2019 20:44:11 +0100")
References: <20190308194411.8573-1-fontaine.fabrice@gmail.com>
Message-ID: <8736naorbj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > mongodb (like gnuradio) needs host-python2 however there is no way to
 > enforce this so add a dependency on !BR2_PACKAGE_PYTHON3.
 > Indeed, if BR2_PACKAGE_PYTHON3 is selected, then buildroot will only
 > build and install host-python-typing for host-python3.

 > This issue was not raised in the previous version of mongodb as
 > host-scons was the only dependency however we now have
 > host-python-typing and host-python-pyyaml dependencies and it
 > does not seem right to enforce python2 on those packages

 > Fixes:
 >  - http://autobuild.buildroot.org/results/693bdba2c01a1b69f56d6ee75094a6a0fc3f40b4

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Arnout Vandecappelle):
 >  - Move python3 dependency under BR2_PACKAGE_MONGODB

Committed to 2019.02.x, thanks.

-- 
Bye, Peter Korsgaard
