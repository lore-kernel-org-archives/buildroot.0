From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Dec 2012 14:13:32 +0100
Subject: [Buildroot] [PATCH] package/uboot-tools: Add mkenvimage for
 host.
In-Reply-To: <50D1BB1D.3090907@syscom.ch>
References: <50D1B74F.805@syscom.ch> <20121219135800.6182a9ba@skate>
 <50D1BB1D.3090907@syscom.ch>
Message-ID: <20121219141332.39b518b4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnaud R?billout,

On Wed, 19 Dec 2012 14:03:25 +0100, Arnaud R?billout wrote:

> >   *) Could you send a proper git patch, with a description,
> >   Signed-off-by line, and sent using git send-email so that it doesn't
> >   get line-wrapped by your mail client.
> Ok I will look at that and do my best.

No problem. If you need help, don't hesitate to ask. Basically, your
mail should look like:

==================================================================
u-boot: add support for mkenvimage installation and usage

U-Boot has an utility called mkenvimage that allows blablabla. This
commit installs this utility and provides configuration options for
blablabla.

Signed-off-by: Arnaud R?billout <rebillout@syscom.ch>
---
<the patch goes here>
==================================================================

This gets done automatically by Git as long as you provide the text
above as the commit log.

> >   *) I would like to see an option being added in the U-Boot
> >   configuration options to pass a txt file containing an environment
> >   definition, which would be passed through mkenvimage to generate an
> >   image environment, and then installed in $(BINARIES_DIR). Could you
> >   cook such a patch, or do you prefer if someone else does it?
> Sounds good to me, I will send you a new patch. Hopefully before the end 
> of the week.

Excellent, thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
