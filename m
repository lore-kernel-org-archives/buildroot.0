From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Oct 2018 21:25:13 +0200
Subject: [Buildroot] [PATCH 01/11] perl-crypt-openssl-rsa: bump to
 version 0.31
In-Reply-To: <20181026032656.9039-1-francois.perrad@gadz.org>
References: <20181026032656.9039-1-francois.perrad@gadz.org>
Message-ID: <20181026212513.37a43b86@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Fri, 26 Oct 2018 05:26:46 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.hash | 4 ++--
>  package/perl-crypt-openssl-rsa/perl-crypt-openssl-rsa.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

I have applied to master the entire series. However, 3 patches made
changes to the hash of the license file, or even changed the license
file being used. Such changes should not be silently ignored: they
should be explicitly mentioned in the commit log, and there should be
an explanation as to why the change of the license file hash is OK.

I did such updates for those 3 patches, but it would be good if your
future contributions included such details.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
