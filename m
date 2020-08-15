From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 15 Aug 2020 16:15:04 +0200
Subject: [Buildroot] [PATCH 1/1] package/kmsxx: fix build with gcc 10
In-Reply-To: <20200814220046.1956454-1-fontaine.fabrice@gmail.com>
References: <20200814220046.1956454-1-fontaine.fabrice@gmail.com>
Message-ID: <20200815161504.5bdea1bc@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 15 Aug 2020 00:00:46 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/7777cd9496e8f8cdb093c3f82c550eebedda0b5d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...0001-fix-compiler-errors-with-gcc-10.patch | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 package/kmsxx/0001-fix-compiler-errors-with-gcc-10.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
