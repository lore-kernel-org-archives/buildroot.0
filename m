From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 23:08:21 +0200
Subject: [Buildroot] [PATCH 2/5] perl-io-socket-ssl: new package
In-Reply-To: <1405614782-3667-2-git-send-email-francois.perrad@gadz.org>
References: <1405614782-3667-1-git-send-email-francois.perrad@gadz.org>
 <1405614782-3667-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <20140717230821.6e188178@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Thu, 17 Jul 2014 18:32:59 +0200, Francois Perrad wrote:

> +PERL_IO_SOCKET_SSL_VERSION = 1.997
> +PERL_IO_SOCKET_SSL_SOURCE = IO-Socket-SSL-$(PERL_IO_SOCKET_SSL_VERSION).tar.gz
> +PERL_IO_SOCKET_SSL_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SU/SULLR/

Yet another issue with the CPAN mirror:
http://autobuild.buildroot.org/results/5f1/5f15763397244d6f89918a8eebc6952a2895bad0/build-end.log.

Any fix?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
