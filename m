From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Dec 2014 22:48:46 +0100
Subject: [Buildroot] [PATCH v2 2/3] libz160: fix dependencies
In-Reply-To: <1417252360-10929-3-git-send-email-jezz@sysmic.org>
References: <1417252360-10929-1-git-send-email-jezz@sysmic.org>
 <1417252360-10929-3-git-send-email-jezz@sysmic.org>
Message-ID: <20141207224846.26c3fb1f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Sat, 29 Nov 2014 10:12:39 +0100, J?r?me Pouiller wrote:
> libz160 is provided as binary. We need EABI toolchain with glibc to use
> it.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/freescale-imx/libz160/Config.in | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied, after tweaking the comments as suggested by Yann.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
