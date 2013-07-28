From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jul 2013 16:29:35 +0200
Subject: [Buildroot] [PATCHv3 0/5] tcl rework (was: make usb_modeswitch
 work with udev)
In-Reply-To: <1372063256-23292-1-git-send-email-richard.genoud@gmail.com>
References: <1371743610-17810-1-git-send-email-richard.genoud@gmail.com>
 <1372063256-23292-1-git-send-email-richard.genoud@gmail.com>
Message-ID: <20130728162935.60b83ef8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Richard Genoud,

On Mon, 24 Jun 2013 10:40:51 +0200, Richard Genoud wrote:

> Richard Genoud (5):
>   tcl: use make conditions
>   tcl: remove strip command
>   tcl: install the libtcl into staging
>   tcl: add a tclsh symlink
>   tcl: make the libtcl writable in order to be stripped
> 
>  package/tcl/tcl.mk |   33 ++++++++++++++++++++++++---------
>  1 file changed, 24 insertions(+), 9 deletions(-)

Committed, thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
