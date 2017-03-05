From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 21:35:36 +0100
Subject: [Buildroot] [PATCH] cryptsetup: install to staging
In-Reply-To: <1488727151-7633-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1488727151-7633-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20170305213536.49f2c4f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  5 Mar 2017 16:19:11 +0100, Thomas Petazzoni wrote:
> cryptsetup installs a library and a header file, so it makes sense to
> install it to staging.
> 
> Fixes bug #9691.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/cryptsetup/cryptsetup.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
