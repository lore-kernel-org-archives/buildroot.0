From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Jan 2021 23:15:23 +0100
Subject: [Buildroot] [PATCH] package/xserver_xorg-server: don't install
 init script if nodm is enabled
In-Reply-To: <20210130101834.18086-1-peter@korsgaard.com>
References: <20210130101834.18086-1-peter@korsgaard.com>
Message-ID: <20210131231523.3a3c9c69@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 30 Jan 2021 11:18:33 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Both S40xorg and S90nodm tries to run an Xserver on vt1, causing the nodm
> one to fail.  If nodm is enabled, then that is likely what the user wants to
> run, so skip installing S40xorg.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 3 +++
>  1 file changed, 3 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
