From: Atle Nissestad <atle@nissestad.no>
Date: Fri, 23 Nov 2007 16:05:32 +0100
Subject: [Buildroot] [PATCH] Add SUSv3 Legacy Macros config option
In-Reply-To: <4746F248.7070306@promwad.com>
References: <200711231506.58719.atle@nissestad.no>
	<4746F248.7070306@promwad.com>
Message-ID: <200711231605.32764.atle@nissestad.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 23. November 2007 16:31:20 Ivan Kuten wrote:
> Hi Atle,
>
> As I remember by previous discussion on mailing list the intention is
> totally get rid of SUSV3_LEGACY_MACROS - that's why it is disabled by
> default.
>
> As I understand correct solution is to fix those packages not to use
> deprecated functions. Some packages already fixed this way - search for
> ***SUSV3.patch in packages/ - but not all.
>
OK, message taken. There are still some packages that need to be fixed (like 
Boa). Are any of these patches sent upstream?

- Atle

> Regards,
> Ivan
