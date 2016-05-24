From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 May 2016 23:30:49 +0200
Subject: [Buildroot] [PATCH v3] Config.in: add -Og option
In-Reply-To: <1463606275-21768-1-git-send-email-martin@surround.io>
References: <1463606275-21768-1-git-send-email-martin@surround.io>
Message-ID: <20160524233049.117a7309@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 May 2016 14:17:55 -0700, Martin Kelly wrote:
> -Og (introduced in GCC 4.8) lets you optimize for debugging experience,
> which can be useful for when you want optimized code that is nonetheless
> debuggable.
> 
> Signed-off-by: Martin Kelly <martin@surround.io>
> ---
> Changes since v2:
> - BR2_OPTIMIZE_g renamed to BR2_OPTIMIZE_G
> ---
>  Config.in           | 10 ++++++++++
>  package/Makefile.in |  3 +++
>  2 files changed, 13 insertions(+)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
