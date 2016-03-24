From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Mar 2016 22:51:26 +0100
Subject: [Buildroot] [PATCH] samba4: bump to version 4.4.0
In-Reply-To: <1458761071-27389-1-git-send-email-gustavo@zacarias.com.ar>
References: <1458761071-27389-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160324225126.400d8a0e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Mar 2016 16:24:31 -0300, Gustavo Zacarias wrote:
> libaio support is now automatic so drop the enable/disable (it will fall
> back to pthread aio if libaio is not present).
> 
> 0002-build-improve-stack-protector-check.patch is upstream so remove it.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../0002-build-improve-stack-protector-check.patch | 56 ----------------------
>  package/samba4/samba4.hash                         |  2 +-
>  package/samba4/samba4.mk                           | 10 +---
>  3 files changed, 3 insertions(+), 65 deletions(-)
>  delete mode 100644 package/samba4/0002-build-improve-stack-protector-check.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
