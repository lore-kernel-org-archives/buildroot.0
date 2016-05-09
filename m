From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 May 2016 22:03:41 +0200
Subject: [Buildroot] [PATCH] libglib2: remove gdbus-codegen from target
In-Reply-To: <1462718229-27164-1-git-send-email-gustavo@zacarias.com.ar>
References: <1462718229-27164-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160509220341.1776d49c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  8 May 2016 11:37:09 -0300, Gustavo Zacarias wrote:
> It requires python and it's normally used at build time, hence since we
> don't support toolchain in the target it really doesn't make much sense.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/libglib2/libglib2.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
