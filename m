From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Oct 2020 22:58:53 +0200
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.58
In-Reply-To: <20201019185609.137352-1-giulio.benetti@benettiengineering.com>
References: <20201019185609.137352-1-giulio.benetti@benettiengineering.com>
Message-ID: <20201024225853.093a094f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 19 Oct 2020 20:56:09 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Bump version to 3.58. Unfortunately local patch is still pending
> upstream and not applied due to Covid-19 latency:
> https://bugzilla.mozilla.org/show_bug.cgi?id=1642174
> 
> Release Notes:
> https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.58_release_notes
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libnss/libnss.hash | 4 ++--
>  package/libnss/libnss.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
