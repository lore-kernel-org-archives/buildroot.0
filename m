From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Sep 2016 22:08:25 +0200
Subject: [Buildroot] [PATCH] toolchain-external: fix potential entire
	root filesystem removal
In-Reply-To: <20160915212233.6ed8f466@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 15 Sep 2016 21:22:33 +0200")
References: <1473929908-25697-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <87k2edeay4.fsf@dell.be.48ers.dk>
 <20160915212233.6ed8f466@free-electrons.com>
Message-ID: <87twdhc4ee.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Hello,
 > On Thu, 15 Sep 2016 12:04:03 +0200, Peter Korsgaard wrote:

 >> > When such conditions are met, Buildroot will run "rm -rf /*" due to
 >> > TOOLCHAIN_EXTERNAL_INSTALL_DIR being empty.  
 >> 
 >> > This bug does not exist in 2016.05, and appeared in 2016.08 due to
 >> > commit a0aa7e0e1750f6ace2879ea8adb1425a41431b79.  
 >> 
 >> Gaah - Committed, thanks!

 > I hope you did some good review on it. The last patches touching this
 > have seen how catastrophic "apparently good looking" patches can be.

Yeah :/

I did try to take a good look at it, but I'll do some more tests before
releasing 2016.08.1

-- 
Venlig hilsen,
Peter Korsgaard 
