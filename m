From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Aug 2012 20:56:52 +0200
Subject: [Buildroot] [PATCH v3 2/2] libglib2: fix install even if the
 host python binary refers to python3
In-Reply-To: <CAHXCMMKrACc1zJpBMFr6iPLPCH-YTbzV9X=tggLy4pQ_c=tXWQ@mail.gmail.com>
References: <1338674897-1810-1-git-send-email-s.martin49@gmail.com>
 <1338674897-1810-2-git-send-email-s.martin49@gmail.com>
 <20120717102211.0a8f59b9@skate>
 <CAHXCMMLFnfw9qUaOcScsNKH10sS8JTHUBiRUHvNNKXT3dk69JQ@mail.gmail.com>
 <CAHXCMMKrACc1zJpBMFr6iPLPCH-YTbzV9X=tggLy4pQ_c=tXWQ@mail.gmail.com>
Message-ID: <20120820205652.44db93f9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sat, 18 Aug 2012 14:06:22 +0200,
Samuel Martin <s.martin49@gmail.com> a ?crit :

> Current state in glib repository:
> A patch fixing this has quite recently been merged upstream (which is
> already included in the glib release 2.32.4 or later, and works fine
> with the current version integrated in BR: 2.30.2):
> http://git.gnome.org/browse/glib/patch/?id=03611f7c0670ea14eedbc121972aed7ce60bb9ee
> 
> So, I'll send a patch integrating the upstream patch.
> If this new patch is accepted, then this patch series (host-python2
> and libglib2 depending on python2) could be discarded.

Excellent! Thanks a lot for the follow-up work. I will discard your
previous patches from the patchwork, and we'll wait for your new patch
integrating the upstream glib solution for this.

Thanks again for working on this!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
