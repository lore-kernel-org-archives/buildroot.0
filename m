From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Sun, 17 Feb 2013 19:52:22 +0200
Subject: [Buildroot] [PATCH] new package: libtasn1
In-Reply-To: <20130217182518.4f9d9d76@skate>
References: <1361118230-9138-1-git-send-email-stefan.froberg@petroprogram.com>
 <20130217182518.4f9d9d76@skate>
Message-ID: <512118D6.8020009@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

17.2.2013 19:25, Thomas Petazzoni kirjoitti:
> Dear Stefan Fr?berg,
>
> On Sun, 17 Feb 2013 18:23:50 +0200, Stefan Fr?berg wrote:
>
>> +LIBTASN1_VERSION = 3.2
>> +LIBTASN1_SOURCE = libtasn1-$(LIBTASN1_VERSION).tar.gz
>> +LIBTASN1_SITE = http://ftp.gnu.org/gnu/libtasn1
>> +LIBTASN1_DEPENDENCIES = host-bison host-microperl
> The microperl package is deprecated, and since perl is part of the
> mandatory dependencies of Buildroot (checked by
> support/dependencies/dependencies.sh), we generally do not make package
> depend on host-microperl.

So I can remove perl completely from dependencies ?

Stefan
