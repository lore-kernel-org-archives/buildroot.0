From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Mar 2020 16:09:56 +0100
Subject: [Buildroot] [PATCH v2] package/libnss: fix PowerPc build failure
In-Reply-To: <20200227110240.14937-1-giulio.benetti@benettiengineering.com>
References: <20200227110240.14937-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200308160956.4db79963@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 27 Feb 2020 12:02:40 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> NSS assumes <sys/auvx.h> is always present but that's not true, so add a
> patch to check if it exists or not.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2:
> * improve patch according to upstream:
>   https://bugzilla.mozilla.org/show_bug.cgi?id=1614183
> ---
>  ...heck-if-PPC-__has_include-sys-auxv.h.patch | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 package/libnss/0001-Bug-1614183-Check-if-PPC-__has_include-sys-auxv.h.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
