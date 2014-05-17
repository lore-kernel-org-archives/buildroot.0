From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 17 May 2014 22:50:36 +0200
Subject: [Buildroot] [PATCH v8 03/28] mesa3d: Depend on xorg meta
	package instead of xserver_xorg-server
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
 <1400342276-10303-4-git-send-email-bernd.kuhls@t-online.de>
 <20140517195636.GD3459@free.fr>
Message-ID: <rluk4bxmh2.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
news:20140517195636.GD3459 at free.fr: 

> It would be nice if you could provide a bit more details in the commit
> log. I fail to see the reason for this change.
> 
> Care to expand a bit the commit log, please?

Hi,

v9 will carry this small note:
"mesa3d does not depend on the xorg server as such, only on X libraries."

Is it enough?

Regards, Bernd
