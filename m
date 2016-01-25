From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 26 Jan 2016 00:14:06 +0100
Subject: [Buildroot] [PATCH 6/8] uclibc: remove 0.9.33 version
In-Reply-To: <56A6ABA8.1060708@gmail.com>
References: <1453148701-10036-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453148701-10036-7-git-send-email-thomas.petazzoni@free-electrons.com>
 <56A6ABA8.1060708@gmail.com>
Message-ID: <56A6AC3E.6070908@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

Le 18/01/2016 21:24, Thomas Petazzoni a ?crit :
> The upstream project is dead, the 0.9.33 version requires tons of
> patches, and uclibc-ng has now successfully replaced uclibc. It is
> time to get rid of the 0.9.33 version.

For some reason I had some issue to apply the patch with pwclient (too many
lines removed at once ? :p )

There is no legacy handling for BR2_UCLIBC_VERSION_0_9_33.

Best regards,
Romain
