From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 29 Nov 2018 08:53:59 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-11-25
In-Reply-To: <CANQCQpb1UiS8-MBfN_4LA0YXwbGjZHM0az2qawSH_Hozj+++Ag@mail.gmail.com>
References: <20181126070051.E6F2920D29@mail.bootlin.com>
 <CANQCQpbODU5sFSaewz3R0z69ZbxxpNrgHPPzQFKd8mHUTj87BA@mail.gmail.com>
 <3d046613-d734-5ffc-9ce1-07b0ec113edd@mind.be>
 <CA+TH9VkwQpWMfjWRL0DDLBv=uzLQke2sVAkFNdcMrVAdRx5GFg@mail.gmail.com>
 <CANQCQpb1UiS8-MBfN_4LA0YXwbGjZHM0az2qawSH_Hozj+++Ag@mail.gmail.com>
Message-ID: <20181129085359.5644557d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 28 Nov 2018 18:29:26 -0600, Matthew Weber wrote:

> I haven't looked but we search and remove all man pages as part of a
> target finalized, right?

Yes:

target-finalize: $(PACKAGES) host-finalize
	[...]
        rm -rf $(TARGET_DIR)/usr/man $(TARGET_DIR)/usr/share/man
	[...]

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
