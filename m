From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 08 Apr 2012 09:10:24 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-04-07
In-Reply-To: <20120408063022.2FA8252CA55@lolut.humanoidz.org> (Thomas
 Petazzoni's message of "Sun, 8 Apr 2012 08:30:22 +0200 (CEST)")
References: <20120408063022.2FA8252CA55@lolut.humanoidz.org>
Message-ID: <87lim6u2an.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 Thomas> Status         : NOK
 Thomas> Failure reason : iproute2-3.1.0
 Thomas> Architecture   : arm
 Thomas> Submitted by   : Thomas Petazzoni (Free Electrons build server)
 Thomas> Submitted at   : 2012-04-07 02:10:50
 Thomas> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=5ee4614c4e72dfab4e8f36186fc8ef4ab05fb9a9
 Thomas> End of log     : http://autobuild.buildroot.net/results/add45d81a78c1515d77fd4abcb5bfe0833c7177b/build-end.log
 Thomas> Complete log   : http://autobuild.buildroot.net/results/add45d81a78c1515d77fd4abcb5bfe0833c7177b/build.log.bz2
 Thomas> Configuration  : http://autobuild.buildroot.net/results/add45d81a78c1515d77fd4abcb5bfe0833c7177b/config
 Thomas> Defconfig      : http://autobuild.buildroot.net/results/add45d81a78c1515d77fd4abcb5bfe0833c7177b/defconfig

What toolchain is this? Gustavoz added uClibc patches for unshare
support, so if this is uClibc you'll need to rebuild the toolchain.

-- 
Bye, Peter Korsgaard
