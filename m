From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Dec 2015 11:37:19 +0100
Subject: [Buildroot] [PATCH v9 06/32] package/efl/libefl: new package
In-Reply-To: <566CA22C.6010808@openwide.fr>
References: <1449927215-3452-1-git-send-email-romain.naour@openwide.fr>
 <1449927215-3452-7-git-send-email-romain.naour@openwide.fr>
 <20151212151524.0b711e40@free-electrons.com>
 <566C699E.5070804@openwide.fr> <566CA22C.6010808@openwide.fr>
Message-ID: <20151213113719.4ad6135c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Sat, 12 Dec 2015 23:39:40 +0100, Romain Naour wrote:

> > I've keept libgcrypt dependency from the old libecore package. I'm not sure we
> > still need it.
> 
> libgcrypt is still needed for the gnutls support otherwise:
> 
> lib/emile/emile_main.c:8:20: fatal error: gcrypt.h: No such file or directory
>  #include <gcrypt.h>

OK. A bit weird, but well, if that's how it's done, let's go for it.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
