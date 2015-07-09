From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 09 Jul 2015 11:48:12 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-07-08
In-Reply-To: <20150709112958.43329535@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 9 Jul 2015 11:29:58 +0200")
References: <20150709063009.DE905100B0F@stock.ovh.net>
 <87lheplrzc.fsf@dell.be.48ers.dk>
 <20150709112958.43329535@free-electrons.com>
Message-ID: <87h9pdll0j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

>> Huh, what happened?

 > Amongst the new toolchain configurations listed in the toolchain CSV
 > file, there was one typo: the toolchain config URL was invalid. Due to
 > this, the Python script has aborted on all autobuilder slaves.

 > I've fixed the typo now
 > (http://git.buildroot.net/buildroot-test/commit/?id=00e2fb0d241eb2e2f0e9bac35f24d729b2c0d8a2),
 > and restarted the autobuilder slaves on the Free Electrons build
 > machine and on gcc75.

 > Could you please restart your autobuilders? Also same for Richard.

Sure, done.

-- 
Venlig hilsen,
Peter Korsgaard 
