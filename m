From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 10 Apr 2020 22:41:43 +0200
Subject: [Buildroot] [PATCH 1/2] package/p7zip: fix CVE-2016-9296
In-Reply-To: <20200410173118.21538-1-nerv@dawncrow.de>
References: <20200410173118.21538-1-nerv@dawncrow.de>
Message-ID: <20200410224143.02f5e50f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Apr 2020 19:31:17 +0200
Andr? Hentschel <nerv@dawncrow.de> wrote:

> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
> ---
>  package/p7zip/0001-CVE-2016-9296.patch | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 package/p7zip/0001-CVE-2016-9296.patch

Thanks, but we need you to add your Signed-off-by *inside* the patches
you're adding. Could you send a v2 with that fixed?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
