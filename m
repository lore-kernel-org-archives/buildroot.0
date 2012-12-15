From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 15 Dec 2012 10:54:34 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-12-14
In-Reply-To: <20121215073441.8B91F52C104@lolut.humanoidz.org> (Thomas
 Petazzoni's message of "Sat, 15 Dec 2012 08:34:41 +0100 (CET)")
References: <20121215073441.8B91F52C104@lolut.humanoidz.org>
Message-ID: <87ip83hc85.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,

 Thomas> On 2012-12-14, 204 random build tests have been done and
 Thomas> submitted on autobuild.buildroot.net.
 Thomas>  103 builds have been successful
 Thomas>  101 builds have failed

 Thomas> Below the results of the failed builds. Successful builds are omitted.

 Thomas> Build e3a2a81327877f9482341daff9623d759d1b2900
 Thomas> ==============================================

 Thomas> Status         : NOK
 Thomas> Failure reason : gd-2.0.35
 Thomas> Architecture   : i686
 Thomas> Submitted by   : Peter Korsgaard (gcc110)
 Thomas> Submitted at   : 2012-12-14 14:11:30
 Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=933ebedd200088600809a1149bb1670c58e25c62
 Thomas> End of log     : http://autobuild.buildroot.net/results/e3a2a81327877f9482341daff9623d759d1b2900/build-end.log
 Thomas> Complete log   : http://autobuild.buildroot.net/results/e3a2a81327877f9482341daff9623d759d1b2900/build.log.bz2
 Thomas> Configuration  : http://autobuild.buildroot.net/results/e3a2a81327877f9482341daff9623d759d1b2900/config
 Thomas> Defconfig      : http://autobuild.buildroot.net/results/e3a2a81327877f9482341daff9623d759d1b2900/defconfig

This looks to be caused by the gettext bump. Gustavo, any ideas?

-- 
Bye, Peter Korsgaard
