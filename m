From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 25 Jun 2017 09:09:28 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-06-23
References: <20170624063043.4336020982@mail.free-electrons.com>
Message-ID: <86442exroe.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 24 Jun 2017 08:30:43 +0200 schrieb Thomas Petazzoni:

>  powerpc64le |                       x265-2.4 | NOK | http://
autobuild.buildroot.net/results/f6a7cb182491f2e16075c37e30306a20291cbe28 
|     
>    powerpc64 |                       x265-2.4 | NOK | http://
autobuild.buildroot.net/results/63286431c69e4eae49046cceb6de790b5a1f8f27 
|     

Hi,

x265 is broken on gcc6 at powerpc64 because of https://gcc.gnu.org/bugzilla/
show_bug.cgi?id=79268

A fix was committed to gcc-6-branch. What is the best solution for 
buildroot, should I add the upstream commits to gcc6 or is should I block 
x265 for gcc6 at powerpc64?

Regards, Bernd
