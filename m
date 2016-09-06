From: Jeff Gray <jeff.gray@sato-global.com>
Date: Tue, 6 Sep 2016 13:37:50 +1000
Subject: [Buildroot] Error with OVERRIDE_SRCDIR in 2016.08
In-Reply-To: <20160905094832.GD5553@free.fr>
References: <CAHb0ztmgZ9sMB0OxF5D7DYmZaU4vekUDcyxp96Ws+w84ZM_R+Q@mail.gmail.com>
 <20160905093714.GC5553@free.fr> <20160905094832.GD5553@free.fr>
Message-ID: <CAHb0ztmYmJ6CELYpcJLrS67sfzg3e2MhZk_+Wh__cvCu=4qEDQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you, that works well. I like the SITE_METHOD as that also means I
don't have -custom on the output directory names.

I did not know about your first idea of using _SOURCE=<empty> and could not
find it in the manual. It might be worth adding a comment about this in the
manual or making it clearer if it is already there.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160906/76279ef3/attachment-0001.html>
