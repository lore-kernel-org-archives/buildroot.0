From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 21:40:41 +0200
Subject: [Buildroot] [PATCH] openswan: fix possible build failure
In-Reply-To: <1396180590-28799-1-git-send-email-gustavo@zacarias.com.ar>
References: <1396180590-28799-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140403214041.2d7accb7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 30 Mar 2014 08:56:30 -0300, Gustavo Zacarias wrote:
> openswan's Makefile uses gcc instead of $(CC) for gcc version detection
> to use advanced warning/error options. The problem is that if the
> host gcc version is newish (>=4.6) and the gcc for the target is not it
> uses unsupported options.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/openswan/openswan-01-gcc-detection.patch | 43 ++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/openswan/openswan-01-gcc-detection.patch

Applied, thanks. Please submit the patch upstream if you can.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
