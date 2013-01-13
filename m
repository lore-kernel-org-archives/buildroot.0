From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 13 Jan 2013 11:01:01 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-01-12
In-Reply-To: <20130113073451.7234252C0FD@lolut.humanoidz.org> (Thomas
 Petazzoni's message of "Sun, 13 Jan 2013 08:34:51 +0100 (CET)")
References: <20130113073451.7234252C0FD@lolut.humanoidz.org>
Message-ID: <87mwwdz9k2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Build 14ef98da6b0632e24514fef696fae9a650c90c96
 Thomas> ==============================================

 Thomas> Status         : NOK
 Thomas> Failure reason : libelementary-1.7.4
 Thomas> Architecture   : i686
 Thomas> Submitted by   : Peter Korsgaard (gcc110)
 Thomas> Submitted at   : 2013-01-12 23:21:42
 Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=83b716a23ad764a5571d7590ab6d38d64d8be13e
 Thomas> End of log     : http://autobuild.buildroot.net/results/14ef98da6b0632e24514fef696fae9a650c90c96/build-end.log
 Thomas> Complete log   : http://autobuild.buildroot.net/results/14ef98da6b0632e24514fef696fae9a650c90c96/build.log.bz2
 Thomas> Configuration  : http://autobuild.buildroot.net/results/14ef98da6b0632e24514fef696fae9a650c90c96/config
 Thomas> Defconfig      : http://autobuild.buildroot.net/results/14ef98da6b0632e24514fef696fae9a650c90c96/defconfig

Seems like there's a problem with the recent ethumb/elementary
change. Arout, any idea? libelementary doesn't explictly depend on
host-pkgconf, but it should have gotten pulled in by E.G. ecore already.

-- 
Bye, Peter Korsgaard
