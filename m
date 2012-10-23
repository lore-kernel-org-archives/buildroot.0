From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 23 Oct 2012 16:38:33 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-10-22
In-Reply-To: <20121023063335.EB98F52C08F@lolut.humanoidz.org> (Thomas
 Petazzoni's message of "Tue, 23 Oct 2012 08:33:35 +0200 (CEST)")
References: <20121023063335.EB98F52C08F@lolut.humanoidz.org>
Message-ID: <871ugpnthy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi Gustavo,

 Thomas> On 2012-10-22, 116 random build tests have been done and
 Thomas> submitted on autobuild.buildroot.net.
 Thomas>  55 builds have been successful
 Thomas>  61 builds have failed

 Thomas> Below the results of the failed builds. Successful builds are omitted.

 Thomas> Build 23da17446266bdd49ea0da0c1892d66d3ac6607f
 Thomas> ==============================================

 Thomas> Status         : NOK
 Thomas> Failure reason : gnutls-2.12.20
 Thomas> Architecture   : arm
 Thomas> Submitted by   : Peter Korsgaard (gcc10)
 Thomas> Submitted at   : 2012-10-22 00:57:41
 Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=6bcb68694f50cdc788114c77bdc7ed1ba39e0bef
 Thomas> End of log     : http://autobuild.buildroot.net/results/23da17446266bdd49ea0da0c1892d66d3ac6607f/build-end.log
 Thomas> Complete log   : http://autobuild.buildroot.net/results/23da17446266bdd49ea0da0c1892d66d3ac6607f/build.log.bz2
 Thomas> Configuration  : http://autobuild.buildroot.net/results/23da17446266bdd49ea0da0c1892d66d3ac6607f/config
 Thomas> Defconfig      : http://autobuild.buildroot.net/results/23da17446266bdd49ea0da0c1892d66d3ac6607f/defconfig

This seems to be caused by the binutils sysroot patch. With that patch
reverted the build works.

Care to take a look?

-- 
Bye, Peter Korsgaard
