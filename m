From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 15:52:41 +0100
Subject: [Buildroot] [PATCH v3] support/scripts: add size-stats-compare
 script
In-Reply-To: <1454418359-22799-1-git-send-email-patrickdepinguin@gmail.com>
References: <1454418359-22799-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <20160207155241.012775ba@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Tue,  2 Feb 2016 14:05:59 +0100, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> Leverage the CSV files produces by size-stats (make graph-size) to allow
> for a comparison of rootfs size between two different buildroot
> compilations.
> 
> The script takes the file-size CSV files of two compilations as input, and
> produces a textual report of the differences per package.
> Using the -d/--detail flag, the report will show the file size changes
> instead of package size changes.
> The -t/--threshold option allows to ignore file size differences smaller
> or equal than the given threshold (in bytes).
> 
> Example output is:
> 
> Size difference per package (bytes), threshold = 0
> --------------------------------------------------------------------------------
>        -8192         busybox
>       228572   added dmalloc
>       301584   added jq
> --------------------------------------------------------------------------------
>       521964         TOTAL

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
