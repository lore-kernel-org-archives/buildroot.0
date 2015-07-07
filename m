From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Jul 2015 08:20:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/libtool: disable makeinfo
In-Reply-To: <559AF52D.5090106@mind.be> (Arnout Vandecappelle's message of
 "Mon, 6 Jul 2015 23:37:49 +0200")
References: <e64f1903478b53f185f3bf114f86c46948a31311.1435886073.git.sam.bobroff@au1.ibm.com>
 <20150704124513.77ae2841@free-electrons.com>
 <559AF52D.5090106@mind.be>
Message-ID: <87wpyco5du.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >  BTW, Thomas, any idea why the autobuilders didn't catch this? Do the chroots
 > have texinfo installed?

I cannot say for Thomas, but the autobuilders I run on gccX do not run
in a chroot, and they do have texinfo installed.

-- 
Bye, Peter Korsgaard
