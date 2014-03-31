From: Eric Jarrige <eric.jarrige@armadeus.org>
Date: Mon, 31 Mar 2014 10:58:09 +0200
Subject: [Buildroot] Patchwork cleanup #7: submitter notification
	(feedback deadline: April 12)
In-Reply-To: <CAAXf6LUAvi_C5NvSa6=mEhcipkBYM6XwPLHhRCZtxBccq05i0g@mail.gmail.com>
References: <CAAXf6LW5stEOk84f-SiPvnYSxazu7vBgM-cNpQStV7j+dcMrbw@mail.gmail.com>
 <CAAXf6LUAvi_C5NvSa6=mEhcipkBYM6XwPLHhRCZtxBccq05i0g@mail.gmail.com>
Message-ID: <CD43324F-6F9A-40AE-94AD-DD25A435DF7C@armadeus.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

>> [v2,1/1] u-boot: allow to pass a custom configuration file
>> http://patchwork.ozlabs.org/patch/276286/
>> Eric Jarrige
>> Yann Morin gave the feedback that this patch allows to overwrite
>> u-boot sources, rendering the declared license possible invalid.

AFAIK this feature cannot overwrite the U-Boot license files and
according to the U-Boot licenses/README - "You can redistribute
U-Boot  and/or modify it under the terms of version 2 of the GNU
General Public License as published by the Free Software
Foundation."
So, it should not be an issue as long as the new config file respects
the terms of the version 2 of the GNU GPL license.

>> Eric: are you still interested in pursuing this patch? If so, I think
>> some further discussion on it should be ignited.


I submitted this patch because I think it is generic enough to support
custom U-Boot configuration file for any board without using a patch
but I can understand I am the only one customizing bootloader for
my boards.
So feel free to reject this patch if there is no interest to manage
U-Boot configuration files within BuildRoot.

Regards,
Eric
