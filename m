From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 22:36:38 +0200
Subject: [Buildroot] [PATCH v2] skeleton: apply locale settings in user
 shells
In-Reply-To: <1436741713-27300-1-git-send-email-arnout@mind.be>
References: <1421684056-5266-6-git-send-email-maxtram95@gmail.com>
 <1436741713-27300-1-git-send-email-arnout@mind.be>
Message-ID: <20150713223638.73d6deaa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Mon, 13 Jul 2015 00:55:13 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> From: Maxim Mikityanskiy <maxtram95@gmail.com>
> 
> Add /etc/profile.d/locale.sh script from Arch Linux to /etc/profile.
> This script looks for locale.conf, sources it, and exports the LANG and
> LC_* variables.
> 
> [Arnout: put in /etc/profile in the skeleton rather than making it
>  systemd specific.]
> 
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> v2 [Arnout]: make the modification to /etc/profile in the skeleton
> rather than something systemd-specific - proposed by Samuel Martin.
> ---
>  system/skeleton/etc/profile | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
