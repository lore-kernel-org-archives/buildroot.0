From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Mar 2020 20:13:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/openjdk-bin: fix install
In-Reply-To: <20200308173737.181294-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 8 Mar 2020 18:37:37 +0100")
References: <20200308173737.181294-1-fontaine.fabrice@gmail.com>
Message-ID: <87y2saslry.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Create $(HOST_DIR)/bin and $(HOST_DIR)/lib otherwise build can fail on:
 > cp -dpfr /home/buildroot/autobuild/instance-2/output-1/build/host-openjdk-bin-13.0.2_8/bin/* /home/buildroot/autobuild/instance-2/output-1/per-package/host-openjdk-bin/host/bin/
 > cp: target '/home/buildroot/autobuild/instance-2/output-1/per-package/host-openjdk-bin/host/bin/' is not a directory
 > package/pkg-generic.mk:276: recipe for target '/home/buildroot/autobuild/instance-2/output-1/build/host-openjdk-bin-13.0.2_8/.stamp_host_installed' failed
 > make: *** [/home/buildroot/autobuild/instance-2/output-1/build/host-openjdk-bin-13.0.2_8/.stamp_host_installed] Error 1

 > Fixes:
 >  - http://autobuild.buildroot.org/results/28bcec0d28003c2784b6cd27039099c65bac3b96

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
