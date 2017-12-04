From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Dec 2017 16:18:40 +0100
Subject: [Buildroot] [PATCH v5 03/11] board: Add Bananapi M64 support
In-Reply-To: <3669564e-b1ff-1ad3-80bd-3d0f021c7735@arm.com>
References: <1509559553-26544-1-git-send-email-jagan@amarulasolutions.com>
 <1509559553-26544-4-git-send-email-jagan@amarulasolutions.com>
 <20171202155818.0d04f798@windsurf.lan>
 <CAMty3ZDAHW7OKSfrJXgLLncpOj8H_XCVDeBFSWaXtVqh5tGEWQ@mail.gmail.com>
 <3669564e-b1ff-1ad3-80bd-3d0f021c7735@arm.com>
Message-ID: <20171204161840.4e84f146@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 4 Dec 2017 15:03:38 +0000, Andre Przywara wrote:

> > Since ADDITIONAL_VARIABLES resembles to use additional parameters for
> > ATF build, I've treated bl31 as additional variable for this ATF  
> 
> I have the same feeling as Thomas: bl31 is just a make target (instead
> of "all" and/or "fip"). So it should be treated like this. Using
> ADDITIONAL_VARIABLES sounds like a hack.

See the series I have posted at
http://lists.busybox.net/pipermail/buildroot/2017-December/208788.html
for a proposal that (among other things) supports bl31 as a proper make
target.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
