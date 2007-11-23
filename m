From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 23 Nov 2007 17:05:52 +0100
Subject: [Buildroot] [PATCH] Add SUSv3 Legacy Macros config option
In-Reply-To: <4746F248.7070306@promwad.com>
References: <200711231506.58719.atle@nissestad.no>
	<4746F248.7070306@promwad.com>
Message-ID: <20071123160552.GB18586@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Nov 23, 2007 at 05:31:20PM +0200, Ivan Kuten wrote:
>Hi Atle,
>
>As I remember by previous discussion on mailing list the intention is totally
>get rid of SUSV3_LEGACY_MACROS - that's why it is disabled by default.
>
>As I understand correct solution is to fix those packages not to use deprecated functions.
>Some packages already fixed this way - search for ***SUSV3.patch in packages/ - but not all.

Unfortunately some people do not use the commonly used string
"susv.*legacy" for these patches. This is inconsistent and should be
fixed.
