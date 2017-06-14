From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jun 2017 08:56:57 +0200
Subject: [Buildroot] [for-next 3/3] package/gcc: remove gcc 4.9
In-Reply-To: <65c27ecf-621e-d145-59cd-eef840c20c46@mind.be>
References: <20170525183457.12169-1-romain.naour@gmail.com>
 <20170525183457.12169-3-romain.naour@gmail.com>
 <20170526151414.11f2d47a@free-electrons.com>
 <6c88ceb4-94f7-6018-6d3a-ae3e99c8d44e@mind.be>
 <874lvjbl2z.fsf@dell.be.48ers.dk>
 <65c27ecf-621e-d145-59cd-eef840c20c46@mind.be>
Message-ID: <20170614085657.0d9ab51f@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 14 Jun 2017 07:30:26 +0200, Arnout Vandecappelle wrote:

>  Yeah, that's another reason: if we remove 4.9 from master, than we will not get
> any fixes for it that could be applied to the LTS branch. But, well, I don't
> think we're testing with 4.9 at all in the autobuilders so the point is kind of
> moot.

We are testing 4.9 in the autobuilders. I rebuilt the pre-built
toolchains a few days ago. We had two gcc 4.8 toolchains, which I moved
to 4.9 toolchains. I always try to make sure we have a few "old"
toolchains, and at least one "bleeding edge" one, just to test more
configurations.

Also, we still have much older external toolchains: remember the recent
ICU breakage caused by ICU requiring gcc 4.8 ? If such breakage
occurred, it's because we do have toolchains with gcc's older than 4.8.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
