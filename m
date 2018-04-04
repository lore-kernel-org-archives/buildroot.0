From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 4 Apr 2018 22:53:41 +0200
Subject: [Buildroot] [PATCH] wolfssl: bump version to 3.14.0
In-Reply-To: <20180404191851.17493-1-peter@korsgaard.com>
References: <20180404191851.17493-1-peter@korsgaard.com>
Message-ID: <20180404225341.765c3849@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 Apr 2018 21:18:51 +0200, Peter Korsgaard wrote:
> Add upstream post-3.14.0 patch to fix build issue related to missing fips.h
> header.
> 
> For more details, see:
> https://github.com/wolfSSL/wolfssl/issues/1415
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...-with-the-creation-of-dummy-fips.h-header.patch | 33 ++++++++++++++++++++++
>  package/wolfssl/wolfssl.hash                       |  2 +-
>  package/wolfssl/wolfssl.mk                         |  2 +-
>  3 files changed, 35 insertions(+), 2 deletions(-)
>  create mode 100644 package/wolfssl/0001-Fix-issue-with-the-creation-of-dummy-fips.h-header.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
