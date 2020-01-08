From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Jan 2020 21:35:04 +0100
Subject: [Buildroot] [PATCH] package/c-periphery: Bump version to 2.1.0
In-Reply-To: <CAMQcK5KsZ5FASDOTh34XHBvv81EaCn6CmYMFVD-680j7NyfnsQ@mail.gmail.com>
References: <20200108192721.19685-1-offougajoris@gmail.com>
 <CAMQcK5KsZ5FASDOTh34XHBvv81EaCn6CmYMFVD-680j7NyfnsQ@mail.gmail.com>
Message-ID: <20200108213504.08ed5d17@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 8 Jan 2020 13:58:00 -0600
Ryan Barnett <ryan.barnett@rockwellcollins.com> wrote:

> Joris,
> 
> Is there any need to update the build environment to support the new
> cross compiling method that has been incorporated?
> 
> https://github.com/vsergeev/c-periphery/commit/742d983e76546d4253df6e89604d7ebaa2507de0

This just add a $(CROSS) variable in front of $(CC), which is not so
useful in the context of Buildroot, because for target packages, we
anyway already pass CC=$(TARGET_CC).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
