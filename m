From: Mohamed Mohamed Nour El-Din <eng.mohamed.nour.eldin@gmail.com>
Date: Thu, 1 Jul 2010 09:59:01 +0300
Subject: [Buildroot] speechtools error
Message-ID: <AANLkTilruVKEB8HLDx4dev6l-lozGbTFv71PMBvr5ZF4@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

hi,
i'm trying to build a system with festival text2speech engine & i got this
error while building speechtools:
making dependencies -- EST_Window.cc delta.cc linux_sound.cc:395:28: error:
alsa/asoundlib.h: No such file or directory
i checked staging/usr/include/alsa & i found asoundlib.h there
can anyone help me with this?
thnx a lot,

regards,
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100701/31ec821e/attachment.html>
