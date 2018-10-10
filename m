From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 09:10:10 +0200
Subject: [Buildroot] [PATCH 10/13] scancpan: add PERL_FOO_DISTNAME in
 perl-foo.mk
In-Reply-To: <20181010064621.19253-11-francois.perrad@gadz.org>
References: <20181010064621.19253-1-francois.perrad@gadz.org>
 <20181010064621.19253-11-francois.perrad@gadz.org>
Message-ID: <20181010091010.50f934cf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Oct 2018 08:46:18 +0200, Francois Perrad wrote:
> this variable is needed for upgrading package with scancpan
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

This variable should be documented in the manual for the Perl
infrastructure.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
