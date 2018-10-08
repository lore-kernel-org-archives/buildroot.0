From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 17:52:51 +0200
Subject: [Buildroot] [PATCH 1/1] Add patches from the upstream
 ltp-testsuite github repository to compile correctly.
In-Reply-To: <20181005064311.28557-1-F.LaRoche@pilz.de>
References: <20181005064311.28557-1-F.LaRoche@pilz.de>
Message-ID: <20181008175251.1f61a310@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 5 Oct 2018 08:43:11 +0200, Florian La Roche wrote:
> Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>
> ---
>  package/ltp-testsuite/0002-execve05.patch | 44 +++++++++++++++++++++++
>  package/ltp-testsuite/0003-statx.patch    | 32 +++++++++++++++++
>  package/ltp-testsuite/0004-statx.patch    | 26 ++++++++++++++
>  3 files changed, 102 insertions(+)
>  create mode 100644 package/ltp-testsuite/0002-execve05.patch
>  create mode 100644 package/ltp-testsuite/0003-statx.patch
>  create mode 100644 package/ltp-testsuite/0004-statx.patch

I marked this one as Superseded in Patchwork, since you have sent a
different version of it.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
