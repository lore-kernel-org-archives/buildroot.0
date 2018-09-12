From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 16:39:06 +0200
Subject: [Buildroot] [PATCH/next v2 2/3]
 package/perl-crypt-openssl-random: bump version to 0.15
In-Reply-To: <20180821204134.2819-2-bernd.kuhls@t-online.de>
References: <20180821204134.2819-1-bernd.kuhls@t-online.de>
 <20180821204134.2819-2-bernd.kuhls@t-online.de>
Message-ID: <20180912163906.013b75f7@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Aug 2018 22:41:33 +0200, Bernd Kuhls wrote:
> Changelog:
> https://metacpan.org/changes/distribution/Crypt-OpenSSL-Random
> 
> Added new build dependency to host-perl-crypt-openssl-guess and force
> it to search for openssl in STAGING_DIR. Added license hash.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

This update is causing issues in the autobuilders:
http://autobuild.buildroot.net/?reason=perl-crypt-openssl-random-0.15.
Since it's only happening since September 9, even though the commit was
made on August 22, maybe the root issue is due to another
update/change, but it breaks this package.

Could you have a look ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
