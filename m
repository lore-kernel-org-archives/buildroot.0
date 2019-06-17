From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 21:05:58 +0200
Subject: [Buildroot] [PATCH 1/3] package/python: add upstream security
 fix for CVE-2019-9948
In-Reply-To: <20190616211712.824-1-peter@korsgaard.com>
References: <20190616211712.824-1-peter@korsgaard.com>
Message-ID: <20190617210558.5eef09c2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 16 Jun 2019 23:17:09 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes CVE-2019-9948: Unnecessary URL scheme exists to allow file:// reading
> file in urllib.
> 
> https://bugs.python.org/issue35907
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...VE-2019-9948-urllib-rejects-local_file-sc.patch | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 package/python/0035-bpo-35907-CVE-2019-9948-urllib-rejects-local_file-sc.patch

All three patches applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
