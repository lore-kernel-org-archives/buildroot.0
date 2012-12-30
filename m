From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 30 Dec 2012 11:02:04 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-12-29
In-Reply-To: <20121230073456.2BCF452C08C@lolut.humanoidz.org> (Thomas
 Petazzoni's message of "Sun, 30 Dec 2012 08:34:55 +0100 (CET)")
References: <20121230073456.2BCF452C08C@lolut.humanoidz.org>
Message-ID: <87r4m7uacj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi Gustavo,

 Thomas> Status         : NOK
 Thomas> Failure reason : gnutls-3.1.5
 Thomas> Architecture   : arm
 Thomas> Submitted by   : Peter Korsgaard (gcc10)
 Thomas> Submitted at   : 2012-12-29 01:40:23
 Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=14989d0be59762a354e7c5c15a2eeb4826d8040b
 Thomas> End of log     : http://autobuild.buildroot.net/results/feadf0791ce300dc0093950867ac1d1b00d0e3fd/build-end.log
 Thomas> Complete log   : http://autobuild.buildroot.net/results/feadf0791ce300dc0093950867ac1d1b00d0e3fd/build.log.bz2
 Thomas> Configuration  : http://autobuild.buildroot.net/results/feadf0791ce300dc0093950867ac1d1b00d0e3fd/config
 Thomas> Defconfig      : http://autobuild.buildroot.net/results/feadf0791ce300dc0093950867ac1d1b00d0e3fd/defconfig

 Thomas> Build f158cb43f02878885c0fc753f5c5a6d7b6ffdb43
 Thomas> ==============================================

 Thomas> Status         : NOK
 Thomas> Failure reason : gnutls-3.1.5
 Thomas> Architecture   : arm
 Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build server)
 Thomas> Submitted at   : 2012-12-29 01:47:40
 Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=14989d0be59762a354e7c5c15a2eeb4826d8040b
 Thomas> End of log     : http://autobuild.buildroot.net/results/f158cb43f02878885c0fc753f5c5a6d7b6ffdb43/build-end.log
 Thomas> Complete log   : http://autobuild.buildroot.net/results/f158cb43f02878885c0fc753f5c5a6d7b6ffdb43/build.log.bz2
 Thomas> Configuration  : http://autobuild.buildroot.net/results/f158cb43f02878885c0fc753f5c5a6d7b6ffdb43/config
 Thomas> Defconfig      : http://autobuild.buildroot.net/results/f158cb43f02878885c0fc753f5c5a6d7b6ffdb43/defconfig

These two looks related to your recent gnutls version bump. Care to have
a look?

 Thomas> Status         : NOK
 Thomas> Failure reason : libecore-1.1.0
 Thomas> Architecture   : powerpc
 Thomas> Submitted by   : Peter Korsgaard (gcc14)
 Thomas> Submitted at   : 2012-12-29 22:18:45
 Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=6a497e3d8c07d816ec5b8d612d4f7563dff9e756
 Thomas> End of log     : http://autobuild.buildroot.net/results/5d595e4f2d7a174ff264593c6c669d223bc334bc/build-end.log
 Thomas> Complete log   : http://autobuild.buildroot.net/results/5d595e4f2d7a174ff264593c6c669d223bc334bc/build.log.bz2
 Thomas> Configuration  : http://autobuild.buildroot.net/results/5d595e4f2d7a174ff264593c6c669d223bc334bc/config
 Thomas> Defconfig      : http://autobuild.buildroot.net/results/5d595e4f2d7a174ff264593c6c669d223bc334bc/defconfig

This is probably also related to it, but perhaps that gets fixed by
Thomas' e17 update.

Did you have a look at the host-gawk issue?

-- 
Bye, Peter Korsgaard
