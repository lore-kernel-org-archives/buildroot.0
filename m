From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 9 May 2018 13:11:19 +0200
Subject: [Buildroot] [RFC PATCH 2/2] support/kconfig: Bump to kconfig
 from Linux 4.17-rc2
In-Reply-To: <20180425160429.21330-2-petr.vorel@gmail.com>
References: <20180425160429.21330-1-petr.vorel@gmail.com>
 <20180425160429.21330-2-petr.vorel@gmail.com>
Message-ID: <20180509111118.bgvb5xd3rpcv7lcn@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> Tests are not included.

> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> I gave up fixing tests to be working with buildroot (suppose we don't
> need them anyway).

> User visible improvements in recent kconfig in mainline are worth to
> backport. There has been quite lot of development since Masahiro Yamada
> took maintainership of Kconfig in upstream. And there are many other
> improvements since v3.13-rc5 :).
I'm sorry, my patch is invalid as it does not address change
911a91c39cab kconfig: rename silentoldconfig to syncconfig

Change is trivial, I'll post v2 in later today.


Kind regards,
Petr
