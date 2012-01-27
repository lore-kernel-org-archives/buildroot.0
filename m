From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jan 2012 12:58:05 +0100
Subject: [Buildroot] Buildroot Developer Day, Friday 3rd February,
 Brussels
In-Reply-To: <201201271133.20517.arnout@mind.be>
References: <20120124000812.6d043023@skate>
 <CAAXf6LW6aCs-G_FD=pXNGsBrV3133donzNxsuNV_7O=9JMCs4Q@mail.gmail.com>
 <201201271133.20517.arnout@mind.be>
Message-ID: <20120127125805.580febd8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Fri, 27 Jan 2012 11:33:20 +0100,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

>  I have a list of 21 ideas for things that I'd like to change in
> buildroot. Any interest in me going over that list?  The most
> important ones are:
> 
>  -- support for overlays (cfr. openembedded)

Ok. I am not sure how it is possible without making Buildroot way more
complicated, but we can have a look at this.

>  -- support for image-in-image (e.g. cpio+kernel on an ext3+grub on
> an MBR partition)

Ok.

> -- shared infrastructure for xxx-yyyconfig

Not sure what you mean here?

>  -- shared infrastructure for non-autotools builds

We already have GENTARGETS, what else do you want? Of course, we can
create infrastructure for Python modules or other types of build
systems, but I'm not sure this is what you're referring to.

>  Also we should make a decision on the host-tools menu that was
> posted on the list before.

Peter has said he was OK with this during the Prague meeting, so I
think the decision has been taken. It only needs to be applied :-)

Peter: could you try to handle the patches in a more FIFO fashion,
rather than the LIFO fashion you're using these days? There are many
patches that have been waiting for a very long time, while the most
recent patches are being taken into account very quickly. Some
examples: the host tools menu Arnout is referring to, or Maxime
Ripard's patches on the per-package device/permission stuff.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
