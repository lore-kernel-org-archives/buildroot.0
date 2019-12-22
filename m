From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 11:02:09 +0100
Subject: [Buildroot] [PATCH 1/3] package/perl-crypt-openssl-aes: new
 package
In-Reply-To: <20191218201845.846-1-patrickdepinguin@gmail.com>
References: <20191218201845.846-1-patrickdepinguin@gmail.com>
Message-ID: <20191222110209.11211c3c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 18 Dec 2019 21:18:42 +0100
Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote:

> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> Standard generated with utils/scancpan, manually updating _LICENSE and
> adding openssl dependency.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  DEVELOPERS                                        |  1 +
>  package/Config.in                                 |  1 +
>  package/perl-crypt-openssl-aes/Config.in          | 11 +++++++++++
>  .../perl-crypt-openssl-aes.hash                   |  6 ++++++
>  .../perl-crypt-openssl-aes.mk                     | 15 +++++++++++++++
>  5 files changed, 34 insertions(+)
>  create mode 100644 package/perl-crypt-openssl-aes/Config.in
>  create mode 100644 package/perl-crypt-openssl-aes/perl-crypt-openssl-aes.hash
>  create mode 100644 package/perl-crypt-openssl-aes/perl-crypt-openssl-aes.mk

All three patches applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
