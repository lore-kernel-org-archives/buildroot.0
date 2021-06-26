From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Jun 2021 15:07:43 +0200
Subject: [Buildroot] [PATCH 1/2] package/usbguard: improve option
 handling
In-Reply-To: <20210623165924.200759-1-fontaine.fabrice@gmail.com>
References: <20210623165924.200759-1-fontaine.fabrice@gmail.com>
Message-ID: <20210626150743.3b9869ce@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 23 Jun 2021 18:59:23 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Don't pass --disable-seccomp and --disable-systemd unconditionally
> While at it, also add a space and a new line when needed
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/usbguard/usbguard.mk | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Thanks, I've applied both patches. For this one, I also took this
opportunity to split the initial CONF_OPTS assignment to have one
option per line, each indented with one tab.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
