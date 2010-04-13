From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Tue, 13 Apr 2010 18:30:21 +0000 (UTC)
Subject: [Buildroot] Question about external toolchain configuration
	"options"
Message-ID: <hq2d7t$5ut$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using an external toolchain, there are a bunch of toolchain 
toolchain "configuration options" in the buildroot .config file (e.g.
support for locale/i18n, wchar, ipv6, program_invokation, etc.).

However, these "options" don't really seem to be options.

There's only one correct choice for each, and buildroot figures out
what those correct choices are at build-time and aborts if the user
has picked the wrong values.

Why are they presented to the user as "choices" when the user doesn't
get to choose their values?  They only seem to be user-configurable
when building a toolchain.  When using an external toolchain, why not
just determine the correct values and do the build?

-- 
Grant Edwards               grant.b.edwards        Yow! My NOSE is NUMB!
                                  at               
                              gmail.com            
