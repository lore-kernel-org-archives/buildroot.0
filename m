From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 30 Mar 2019 15:10:56 +0100
Subject: [Buildroot] [PATCH 1/1] package/xenomai: fix build with gcc 8
In-Reply-To: <20190330132830.19249-1-fontaine.fabrice@gmail.com>
References: <20190330132830.19249-1-fontaine.fabrice@gmail.com>
Message-ID: <20190330151056.2ca8aa64@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 30 Mar 2019 14:28:30 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Patch was wrongly removed in d0dcca4705aaae85ce4ef0dc637b95fd4e81b9b3
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/beac5f07c3b56596a6d9d5a1bcf29eb2837c4829
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...ated-destination-buffer-with-strncpy.patch | 91 +++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 package/xenomai/0001-demos-posix-prevent-unterminated-destination-buffer-with-strncpy.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
