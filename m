From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 09:52:09 +0200
Subject: [Buildroot] [PATCH] package/acpid: refactor init script
In-Reply-To: <20191023180512.21400-1-unixmania@gmail.com>
References: <20191023180512.21400-1-unixmania@gmail.com>
Message-ID: <20191026095209.1f09f4d0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 23 Oct 2019 15:05:12 -0300
unixmania at gmail.com wrote:

> From: Carlos Santos <unixmania@gmail.com>
> 
> Adapt the format to the current template, used in other init scripts.
> 
> Move the one socond delay in restart to stop, giving acpid time to send
> dying gasp to syslog.
> 
> Users willing to add start arguments can set the ACPID_ARGS variable in
> /etc/default/acpid instead of rewriting the init script.
> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>  package/acpid/S02acpid | 65 +++++++++++++++++++++++++++++++-----------
>  1 file changed, 48 insertions(+), 17 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
