From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Aug 2017 10:53:03 +0200
Subject: [Buildroot] Patch: new board Socrates Cyclone 5
In-Reply-To: <20170801075456.ir2ubcdo2h3n5r5l@ed>
References: <aafbf1fc-74ab-1be4-5c58-76a2db9b97e3@gmail.com>
 <20170730151502.6e99d720@windsurf.lan>
 <20170801075456.ir2ubcdo2h3n5r5l@ed>
Message-ID: <20170801105303.48d9fcb3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 1 Aug 2017 09:54:56 +0200, Lionel Flandrin wrote:

> Can I access this preloader.bin somewhere? I could check if there's
> anything obviously special about it.

The preloader.bin is part of the patch that Micha? sent:

  https://patchwork.ozlabs.org/patch/795350/

And the very reason why I opened up this thread is because it's not
great to have pre-built bootloader images in the Buildroot tree.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
