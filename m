From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 May 2015 22:45:27 +0200
Subject: [Buildroot] [PATCH] binutils: backport xtensa trampolines
 relaxation optimization
In-Reply-To: <1430855841-31414-1-git-send-email-jcmvbkbc@gmail.com>
References: <1430855841-31414-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20150505224527.4a4aedef@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Tue,  5 May 2015 22:57:21 +0300, Max Filippov wrote:
> This optimization alone reduces gnuradio build time for xtensa from 2
> hours to 40 minutes.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  ...10-xtensa-optimize-trampolines-relaxation.patch | 346 +++++++++++++++++++++
>  ...10-xtensa-optimize-trampolines-relaxation.patch | 346 +++++++++++++++++++++
>  2 files changed, 692 insertions(+)
>  create mode 100644 package/binutils/2.24/910-xtensa-optimize-trampolines-relaxation.patch
>  create mode 100644 package/binutils/2.25/910-xtensa-optimize-trampolines-relaxation.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
