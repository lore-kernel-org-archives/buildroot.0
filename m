From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 28 Jan 2021 18:37:36 +0100
Subject: [Buildroot] [PATCH] package/postgresql: add some additional
 output to pg_config
In-Reply-To: <20210125113613.865987-1-fido_max@inbox.ru> (Maxim Kochetkov via
 buildroot's message of "Mon, 25 Jan 2021 14:36:12 +0300")
References: <20210125113613.865987-1-fido_max@inbox.ru>
Message-ID: <87sg6l2c9r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxim" == Maxim Kochetkov via buildroot <buildroot@busybox.net> writes:

 > Some external packages call pg_config to determine the installed
 > PostgreSQL options. Add this output to Buildroots own pg_config,
 > so these packages correctly compile.

 > Added options:
 > 	--pkgincludedir
 > 	--pgxs
 > 	--cflags
 > 	--cc
 > 	--pkglibdir
 > 	--bindir
 > 	--sharedir
 > 	--localedir
 > 	--docdir
 > 	--mandir

 > Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
