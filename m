From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Jan 2017 16:38:10 +1300
Subject: [Buildroot] [PATCH] package/cbootimage: add patch to fix
 bct_dump crash
In-Reply-To: <1483488605-30412-1-git-send-email-zombah@gmail.com>
References: <1483488605-30412-1-git-send-email-zombah@gmail.com>
Message-ID: <20170125163810.2469f76f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  4 Jan 2017 03:10:05 +0300, Misha Komarovskiy wrote:
> Patch from upstream until version 1.8 release.
> 
> Signed-off-by: Misha Komarovskiy <zombah@gmail.com>
> ---
>  ...on-t-crash-on-devices-without-RSA-support.patch | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 package/cbootimage/0001-bct_dump-don-t-crash-on-devices-without-RSA-support.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
