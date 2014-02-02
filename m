From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 02 Feb 2014 15:21:02 +0100
Subject: [Buildroot] [git commit] gst1-libav: new package
In-Reply-To: <CAAXf6LVSH0EDVR3x34TeMehYd2dJG0r8jX9jgUb=BoJwob2Hpg@mail.gmail.com>
 (Thomas De Schampheleire's message of "Sun, 2 Feb 2014 13:09:24
 +0100")
References: <20140201124728.6D5269C6A2@busybox.osuosl.org>
 <CAAXf6LVSH0EDVR3x34TeMehYd2dJG0r8jX9jgUb=BoJwob2Hpg@mail.gmail.com>
Message-ID: <87d2j5r3xt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

Hi,

 > It seems that this commit also covers the changes made by Bogdan Radulescu in
 > http://patchwork.ozlabs.org/patch/207431/

Yes, I believe so.

 > One difference that I noticed is that Bogdan added a dependency on
 > BR2_LARGEFILE, while this patch does not.
 > Are you sure this is not needed (anymore) ?

Well, as I pointed out I don't see why largefile is needed (and it
builds without it), but I haven't actually done any runtime testing.

-- 
Bye, Peter Korsgaard 
