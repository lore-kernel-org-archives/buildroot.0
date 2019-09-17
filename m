From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 22:23:40 +0200
Subject: [Buildroot] [PATCH 1/2] package/fio: fix build with glibc 2.30
In-Reply-To: <20190916165102.19754-1-fontaine.fabrice@gmail.com>
References: <20190916165102.19754-1-fontaine.fabrice@gmail.com>
Message-ID: <20190917222340.5aff3693@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 16 Sep 2019 18:51:01 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/ec93c8e7f046b081aaa9e0a76708d61ba1ab921c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../fio/0001-configure-add-gettid-test.patch  | 200 ++++++++++++++++++
>  1 file changed, 200 insertions(+)
>  create mode 100644 package/fio/0001-configure-add-gettid-test.patch

Both applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
