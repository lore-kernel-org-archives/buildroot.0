From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Jul 2018 13:47:35 +0200
Subject: [Buildroot] [PATCH 00/10] new perl packages
In-Reply-To: <20180712210054.13775-1-thomas.de_schampheleire@nokia.com>
References: <20180712210054.13775-1-thomas.de_schampheleire@nokia.com>
Message-ID: <20180716134735.6bbd3696@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Jul 2018 23:00:44 +0200, Thomas De Schampheleire wrote:

> 
> Thomas De Schampheleire (10):
>   perl-convert-asn1: new package
>   perl-crypt-blowfish: new package
>   perl-crypt-cbc: new package
>   perl-digest-md5: new package
>   perl-mime-base64-urlsafe: new package
>   perl-mojolicious-plugin-authentication: new package
>   perl-net-ping: new package
>   perl-net-snmp: new package
>   perl-net-ssh2: new package
>   perl-net-telnet: new package

I have applied. However, the <pkg>_LICENSE variable is missing for some
packages, and it would be good to add it. This is particularly striking
for perl-crypt-blowfish, which does have a COPYRIGHT file, so clearly,
it has some license information.

Could you send follow-up patches to add those license details ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
