From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 12 Apr 2014 18:52:42 +0200
Subject: [Buildroot] [PATCH 1/1] xbmc: Depend on host-gettext
References: <1397319021-20282-1-git-send-email-bernd.kuhls@t-online.de>
 <20140412184222.6406c780@skate>
Message-ID: <qj7o1bx17m.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote
in news:20140412184222.6406c780 at skate: 

> Why is XBMC autoreconf'ed ? It does not have XBMC_AUTORECONF = YES, so
> it should normally not be autoreconfed.

Hi,

because the tarball does not include ./configure, only configure.in.
Xbmc is autoreconf'ed by calling ./bootstrap using XBMC_PRE_CONFIGURE_HOOKS 
which initiates its own magic ;)

Regards, Bernd
