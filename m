From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Sun, 17 Feb 2013 19:55:11 +0200
Subject: [Buildroot] [PATCH] new package: iso-codes
In-Reply-To: <20130217183012.73c87347@skate>
References: <1361118896-2263-1-git-send-email-stefan.froberg@petroprogram.com>
 <20130217183012.73c87347@skate>
Message-ID: <5121197F.1060201@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

17.2.2013 19:30, Thomas Petazzoni kirjoitti:
> Dear Stefan Fr?berg,
>
> On Sun, 17 Feb 2013 18:34:56 +0200, Stefan Fr?berg wrote:
>
>> +	select BR2_PACKAGE_GETTEXT
> Are you sure it really needs gettext as a build dependency?

Well, I did not try to build it without gettext installed but that's
what the gentoo ebuild file
lists as its hard dependency

> Also, this seems to install a big bunch of files. Maybe
> network-manager-applet needs only some of the ISOxyz files, and
> therefore having suboptions to select which ISOxyz set of files should
> be installed would be useful?
>

I have to check it.

Stefan
