From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 22:34:40 +0100
Subject: [Buildroot] [PATCH 0/7] suppport/testing: more Perl/CPAN modules
In-Reply-To: <20181204043754.24556-1-francois.perrad@gadz.org>
References: <20181204043754.24556-1-francois.perrad@gadz.org>
Message-ID: <20181206223440.03eed06c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  4 Dec 2018 05:37:47 +0100, Francois Perrad wrote:

> Francois Perrad (7):
>   scancpan: mark XS modules in docstring of test
>   support/testing/tests/packages/test_perl_*: regeneration
>   scancpan: allow the generation of more tests
>   support/testing: add perl-dbd-mysql test
>   support/testing: add perl-encode-decode test
>   support/testing: add perl-io-socket-multicast test
>   support/testing: add perl-io-socket-ssl test

Thanks, series applied. I added a patch that regenerates
the .gitlab-ci.yml file so that the new tests are really used.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
