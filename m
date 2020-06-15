From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 15 Jun 2020 14:28:49 +0200
Subject: [Buildroot] [PATCH v2 01/14] package/systemd: configure nss
 plugins in nsswitch.conf
In-Reply-To: <20200615114825.GZ2346@scaer>
References: <20200615072055.2083-1-nolange79@gmail.com>
 <20200615072055.2083-2-nolange79@gmail.com>
 <20200615114825.GZ2346@scaer>
Message-ID: <CADYdroN2yUOhkbNLTGLvsPEjhAh0Nv0LAyPLictTFL9mhhYjWQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mo., 15. Juni 2020 um 13:48 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:

>  2. we already have other packages that may tweak that file, like:
>     package/nss-mdns/nss-mdns.mk
>     package/nss-myhostname/nss-myhostname.mk

The package nss-myhostname should be marked as conflicting with
BR2_PACKAGE_SYSTEMD_MYHOSTNAME.
(the plugin got assimilated by systemd)

Norbert
