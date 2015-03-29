From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Mar 2015 15:22:23 +0200
Subject: [Buildroot] [PATCH] linux-ext: update Xenomai help text
In-Reply-To: <1427409915-14913-1-git-send-email-romain.naour@openwide.fr>
References: <1427409915-14913-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150329152223.2d825713@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Thu, 26 Mar 2015 23:45:15 +0100, Romain Naour wrote:
> Reword the help text and get ride of the supported kernel
> version list which is outdated since Xenomai version bump.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> ---
>  linux/Config.ext.in | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)

Thanks, I rewrapped the text which had too long lines, and fix a number
of typos. Applied after that, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
