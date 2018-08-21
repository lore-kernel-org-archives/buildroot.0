From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Aug 2018 22:49:55 +0200
Subject: [Buildroot] [PATCH/next v2 2/3]
 package/perl-crypt-openssl-random: bump version to 0.15
In-Reply-To: <20180821204134.2819-2-bernd.kuhls@t-online.de>
References: <20180821204134.2819-1-bernd.kuhls@t-online.de>
 <20180821204134.2819-2-bernd.kuhls@t-online.de>
Message-ID: <20180821224955.58358a40@windsurf>
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
> ---
> v2: switched to host version of perl-crypt-openssl-guess (Thomas)

It would be nice if you could *reply* to the review e-mails that are
being sent to you. Indeed, I'd like to have more explanation about this.

How is it possible that your previous iteration, which was adding
perl-crypt-openssl-guess as a *target* package could be working ?

Thmas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
