From: Micha Nelissen <micha@neli.hopto.org>
Date: Wed, 05 Sep 2007 20:46:14 +0200
Subject: [Buildroot] Uclibc 0.9.29 compiler error
In-Reply-To: <fbkjea$tfd$1@sea.gmane.org>
References: <fbkjea$tfd$1@sea.gmane.org>
Message-ID: <fbmtkd$r6o$1@sea.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Micha Nelissen wrote:
> I am using buildroot SVN, gcc 4.2.1, uclibc 0.9.29, armeb-linux for
> xscale. I've configured to use software floating point. Linking of

It does work with gcc 3.4.6. With the 4.x branch it seems NPTL is
necessary, which doesn't work in uclibc-arm.

Micha
