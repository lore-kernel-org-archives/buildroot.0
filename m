From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Aug 2014 19:18:10 +0200
Subject: [Buildroot] [autobuild PATCH] autobuild-run: do not set
 BR2_JLEVEL and BR2_DL_DIR in the configuration
In-Reply-To: <1407311907-3878-1-git-send-email-fabio.porcedda@gmail.com>
References: <1407311907-3878-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20140829191810.73bcff76@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Wed,  6 Aug 2014 09:58:27 +0200, Fabio Porcedda wrote:
> Instead of setting BR2_JLEVEL and BR2_DL_DIR in the configuration file
> pass those variable as options on the command line, so that the
> configuration files can be re-used on other machines with no change.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>  scripts/autobuild-run | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)

Thanks, I've applied your patch.

I'll notify the people running the script so that they update it. It
will therefore take a bit of time before seeing configuration that
don't set BR2_JLEVEL and BR2_DL_DIR.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
