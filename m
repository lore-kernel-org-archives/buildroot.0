From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 06 Dec 2020 18:36:55 +0100
Subject: [Buildroot] [PATCH v2 2/2] package/bind: bump version to 9.16.9
References: <20201206140737.3890199-1-bernd.kuhls@t-online.de>
 <20201206140737.3890199-2-bernd.kuhls@t-online.de>
Message-ID: <nehv9hxru6.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 06 Dec 2020 15:07:37 +0100 schrieb Bernd Kuhls:

> Signed-off-by: Bernd Kuhls
> <bernd.kuhls@t-online.de>
> ---
> v2: removed duplicate dependency (Baruch)

Hi,

building the "dhcp (ISC)" package is broken with bind 9.16.x.:

../includes/omapip/isclib.h:51:10: fatal error: isc/boolean.h: No such 
file or directory

Closed the patches series on patchworks after noticing
https://gitlab.isc.org/isc-projects/dhcp/-/issues/100#note_129883

"Getting ISC DHCP to build with 9.16.x, per Francis, would be labor 
intensive and not something we should pursue."

Regards, Bernd
