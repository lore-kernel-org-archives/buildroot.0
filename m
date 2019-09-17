From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 22:30:21 +0200
Subject: [Buildroot] [PATCH 5/7] package/perl-mailtools: bump to version
 2.21
In-Reply-To: <20190917181624.29378-5-francois.perrad@gadz.org>
References: <20190917181624.29378-1-francois.perrad@gadz.org>
 <20190917181624.29378-5-francois.perrad@gadz.org>
Message-ID: <20190917223021.2e44b710@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Sep 2019 20:16:22 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl-mailtools/Config.in           | 2 +-
>  package/perl-mailtools/perl-mailtools.hash | 6 +++---
>  package/perl-mailtools/perl-mailtools.mk   | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)

Here as well, you changed the license file hash without any
explanation, so I've added some.

However, the license file being used is README, which does not contain
any useful license related information. Using the README.md file would
be a lot more interesting, as it contains:

======

## Copyright and License

Graham Barr wrote most of these components, since 2001 maintained by
Mark Overmeer. Copyright is with these authors.

This project is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.
See <http://dev.perl.org/licenses/>

======

Could you send a patch to use README.md instead of README, and of
course make sure that scancpan will continue to use README.md moving
forward ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
