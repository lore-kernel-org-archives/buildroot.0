From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Jan 2015 21:16:30 +0100
Subject: [Buildroot] [PATCH] mpfr: security bump to patchlevel 11
In-Reply-To: <1420744587-28229-1-git-send-email-gustavo@zacarias.com.ar>
References: <1420744587-28229-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150108211630.2953e01e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu,  8 Jan 2015 16:16:27 -0300, Gustavo Zacarias wrote:
> Fixes CVE-2014-9474 - buffer overflow in mpfr_strtofr.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/mpfr/0001-patchlevel11.patch | 1631 ++++++++++++++++++++++++++++++++++
>  1 file changed, 1631 insertions(+)
>  create mode 100644 package/mpfr/0001-patchlevel11.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
