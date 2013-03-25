From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Mar 2013 11:02:42 +0100
Subject: [Buildroot] Quick summary of the Patchwork Day #1
Message-ID: <20130325110242.0b741196@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Yesterday took place the first Patchwork Day, as we announced
previously on this list. Samuel, Yann, Peter, Gustavo and myself were
present more or less throughout the day, with Thomas De Schampheleire
making an apparition at some point in the day. Thanks to the
participants!

At the beginning of the day, we had a bit more than 500 patches pending
in patchwork, and we're now at 305 patches. But on those 305 patches,
some of them are new patches that have been reworked from previous
versions, so hopefully they should be more easily applied by Peter.

http://lite.framapad.org/p/Buildroot_Patchwork_Day_March_2013 is a
rough summary of the topics worked on. In short:

 * The oprofile 0.9.8 PowerPC build fix from Thomas De S. was committed.

 * There has been discussions and iterations on Samuel's patches about
   the manual and its list of packages. At the end of the day, Yann has
   pulled Samuel's patches, and sent a pull request for them to Peter.

 * The big X.org bump was tested by me, and later pulled by Peter. On
   its own, it accounts for more than 100 patches removed from the
   patchwork.

 * The gcc 4.8 support has been merged.

 * The set of mandatory dependencies to run Buildroot has been changed.
   We no longer require bison, flex or gettext to be installed. A
   number of follow-up patches have been submitted to fix issues caused
   by this change: the Free Electrons autobuilders no longer have
   those packages installed, so errors started to show up pretty
   quickly.

 * A big number of other patches/packages were worked on or cleaned up:
   zeromq bindings, gutenprint, enscript, log4cxx,
   xcursor-transparent-theme, libpthsem, bcusdk, linknx, dtach, etc.

 * A number of patches were reviewed and Acked, or discussed on the IRC
   channel and rejected or marked as Superseded when a fix has already
   been committed for the same problem.

All in all, I think it was a very useful day, and the fact that we
could very quickly discuss patches on the IRC channel and take a
decision about them certainly helped.

Would there be some interest to renew the experience some other day?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
