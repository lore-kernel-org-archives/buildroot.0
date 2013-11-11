From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Nov 2013 22:54:35 +0100
Subject: [Buildroot] Make Acked/Reviewd/Tested-by tags visible
Message-ID: <20131111215435.GC3510@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

In the Buildroot community, we make heavy use of patchwork to track the
patches that we still have pending. The maintainer (Peter, CCed) almost
exclusively use pwclient to get that list of patches to apply.

Since we also use the Linux-like tags Acked-by, Reviewed-by and
Tested-by, this is an indication to Peter that a patch is ready to be
applied.

Unfortunately, it is not easy to know at a glance what patches have such
tags, without checking the mailing list, so for each patch.

We would like to suggest that the web GUI and the pwclient CLI both
display such tags besides each patch, a bit like (hypotetical output of
pwclient):

    ID     Tags State       Subject
    123456 ART  New         Wonderfull patch to apply quickly

Where each of 'A', 'R', and 'T' would mean Acked-by, Reviewed-by and
Tested-by, respectively. An uppercase letter would mean two of more of
such tag, while a lower-case letter would mean a single such tag.

This way, it is easy to quickly sort high-profile patches that can be
easily handled by Peter without too much work (patches with tags), and
to the other contributors (some in Cc too) as a list of patches to look
at (patches without a tag).

Since patchwork already inserts those tags to the commit log (eg.
pwclient view PATCH-ID), I hope it would be easy enough to also display
it in the patch list.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
