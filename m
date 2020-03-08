From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Mar 2020 15:05:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: needs host-python3
In-Reply-To: <20200308111812.3065154-1-fontaine.fabrice@gmail.com>
References: <20200308111812.3065154-1-fontaine.fabrice@gmail.com>
Message-ID: <20200308150547.21a882d7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  8 Mar 2020 12:18:12 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> host-python3 is a mandatory dependency since bump to version 4.10.0 and
> https://gitlab.com/samba-team/devel/samba/-/commit/5ddff307b4af5c82d5064745f5bd2c33bd340ced

This commit says:

""
Users wishing to use python2 to build need to specify PYTHON=
to both ./configure and make
""

So it seems like Python 3.x is not necessary. Have you tried that?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
