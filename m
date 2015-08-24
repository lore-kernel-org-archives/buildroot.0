From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Mon, 24 Aug 2015 12:14:28 +0200
Subject: [Buildroot] [PATCH 7/7 v2] mysql: add mariadb galera cluster
 variant
In-Reply-To: <55D8F5CD.2070203@mind.be>
References: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>
 <1436458921-4199-8-git-send-email-sylvain.raybaud@green-communications.fr>
 <CAHXCMMKV79jKA9YcA_f6KxWuivKMjP8_zZKjHjAHDU6hgiiXCg@mail.gmail.com>
 <20150710095419.1ec6da31@free-electrons.com>
 <55C4B65A.3010804@green-communications.fr>
 <20150808104308.2438494b@free-electrons.com> <20150808232242.GC3594@free.fr>
 <55D8F5CD.2070203@mind.be>
Message-ID: <55DAEE84.6090302@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Arnout, Yann, all

On 23/08/2015 00:21, Arnout Vandecappelle wrote:
> On 08/09/2015 01:22 AM, Yann E. MORIN wrote:
>>> Now, the mariadb vs. mysql case might not be so problematic. We
>>> don't much expect a myriad of alternate implementations to just
>>> pop-up over the night,
> Well, actually... IIUC there are in fact two MariaDB
> implementations: the cluster verion (Galera, added here) and the
> single-node version. Well, they might actually be the same, but the
> download URLs are different.
> 
> Sylvain, can you comment?

That's right, there are two variants: MariaDB and MariaDB galera. The
later includes the capability of running as a cluster, when run with
the galera plugin. They are not the same but I haven't thoroughly
looked at the differences since it's the cluster I'm interested in. I
agree that ideally a third choice "mariadb" should be added. I've only
been focused on mariadb galera for now, but I don't think it's much
more work to add mariadb. Maybe I can do it after I'm done with
mariadb galera?

Cheers,

- -- 
Sylvain Raybaud
www.green-communications.fr
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV2u6EAAoJEEkkwl4JtJ9yrEMP/0G2yWR/AV8GJa+jW3p1Km3e
WuxJgvELUwgoL5gcPsjmqmBENBC19j0Z1StHDXefD3b91wv1NPxF/oJ/4yawNt0g
m22SWl3N0fMw4AAVM1m64wx/XdeJxU3usz3nDdQb1xC7675fOAFWmH4/PoSmFj/2
WsqB8IPh8GQWVOwJSTEOnTyXOCLSfTqsq643X3j88HwvSuHg52t3r7ObqbS8819E
H16eMFmD3qZbEr05hvRsHBEnXl0czrpFaEoc5zAui+CJgKS/oP+zkYNTRW/8gkgV
c0/LGHflQD+YsrmlamNWtqoC1p45/Zhy9shpMG4LEv9c9Us9UXiGwTFWmtyXzsta
wN+s6Po8JslkDRKYXB2M0AJ6aHWgbWDPe9kaOXI9maPIVlHTSKfGEUQHQaoz0kQn
04JvKlSjFlol7HUrvoA8Z08hefC90HkkGViEVy5csy01fN/WbkFwam0AvvpwIbOa
olFrwseslgnLba3OvnTY/4/GRKkq4m3ROycf/lTY/YhiZ8T9X3LflNm/tNYF7bYa
VOfIp7gEdQtp1/cJ/Srk/4F0VCMzB+2x40Evs+g2v/KNmSG2eNceem7bm2O+VKok
hSvZQRsMDkremwHb4KU5i14NFL/rkCnHLlmflvnWgV5JkGfD2Yoo/aQytHRzYXV/
BebcNtnMT7LYy7oOAYt0
=Y5rG
-----END PGP SIGNATURE-----
