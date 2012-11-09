From: =?ISO-8859-1?Q?Fran=E7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 9 Nov 2012 22:13:35 +0100
Subject: [Buildroot] [PATCH] perl: build with perlcross instead of qemu
In-Reply-To: <1352425626-10628-1-git-send-email-arnout@mind.be>
References: <1352425626-10628-1-git-send-email-arnout@mind.be>
Message-ID: <CAB0FRsvEUb54jsmw+aLNt0mEvQpBSMkY3HtUq5ENUg1XaL7MmA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/11/9 Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>:
> The perlcross project makes it possible to properly cross-compile
> perl.  It creates a host-miniperl that is configured for the target
> and uses that to cross-compile the perl modules.
>
> Unfortunately there are still a few hacks needed to make it work.
> Proper fixes can be developed and upstreamed later.
>
> Since there is no longer a dependency on qemu, it works on all
> architectures again.
>
> Also removed some config options:
> - BR2_PACKAGE_PERL_CUSTOM_INSTALL just allows a selection of modules;
> this can also be encoded by an empty BR2_PACKAGE_PERL_MODULES.
> - BR2_PACKAGE_PERL_DB_FILE and BR2_PACKAGE_PERL_GDBM_FILE can be
> derived automatically from the package configs.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

The 3 following patches are now useless :
   package/perl/perl-configure-qemu.patch
   package/perl/perl-make-ext.patcg
   package/perl/perl-mkppport.patch

Fran?ois
