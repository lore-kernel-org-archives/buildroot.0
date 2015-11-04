From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Nov 2015 21:50:46 +0100
Subject: [Buildroot] [PATCH] package/rng-tools: systemd: support extra
 options
In-Reply-To: <1445381008-5165-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
References: <1445381008-5165-1-git-send-email-benoit.thebaudeau.dev@gmail.com>
Message-ID: <20151104215046.14224334@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Beno?t Th?baudeau,

On Wed, 21 Oct 2015 00:43:28 +0200, Beno?t Th?baudeau wrote:
> Add a DAEMON_ARGS configuration variable in order to make it possible to
> pass custom extra options to rngd. This environment variable must
> defined in /etc/default/rngd if needed, like with the SysV init script.
> This file does not have to be present if not needed.
> 
> Signed-off-by: Beno?t Th?baudeau <benoit.thebaudeau.dev@gmail.com>
> ---
>  package/rng-tools/rngd.service | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
