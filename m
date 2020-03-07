From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Mar 2020 22:02:54 +0100
Subject: [Buildroot] [PATCH v5 00/12] pkg-stats json output improvements
In-Reply-To: <20200307075633.7514-1-heiko.thiery@gmail.com>
References: <20200307075633.7514-1-heiko.thiery@gmail.com>
Message-ID: <20200307220254.69d2921d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 Mar 2020 08:56:21 +0100
Heiko Thiery <heiko.thiery@gmail.com> wrote:

> Heiko Thiery (12):
>   support/scripts/pkg-stats: store latest version in a dict
>   support/scripts/pkg-stats: store patch files for the package
>   support/scripts/pkg-stats: set developers info
>   support/scripts/pkg-stats: store licences of package
>   support/scripts/pkg-stats: add package status
>   support/scripts/pkg-stats: add package count to stats
>   support/scripts/pkg-stats: store pkg dir path
>   support/scripts/pkg-stats: add defconfig support
>   support/scripts/pkg-stats: add support for license hash check
>   support/scripts/pkg-stats: set status to 'na' for virtual packages
>   support/scripts/pkg-stats: initialize all package status checks
>   support/scripts/pkg-stats: add status for cve check

I've applied the entire series to next, except
"support/scripts/pkg-stats: add support for license hash check" as I
explained as a reply to this patch.

Also, I fixed the daily-mail script from the buildroot-test repo to be
compatible with the new JSON format.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
