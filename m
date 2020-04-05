From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Apr 2020 16:26:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/bubblewrap: security bump to
 version 0.4.1
In-Reply-To: <20200404220648.1543017-1-fontaine.fabrice@gmail.com>
References: <20200404220648.1543017-1-fontaine.fabrice@gmail.com>
Message-ID: <20200405162643.3557e18b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  5 Apr 2020 00:06:48 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2020-5291: Bubblewrap (bwrap) before version 0.4.1, if installed
> in setuid mode and the kernel supports unprivileged user namespaces,
> then the `bwrap --userns2` option can be used to make the setuid process
> keep running as root while being traceable. This can in turn be used to
> gain root permissions. Note that this only affects the combination of
> bubblewrap in setuid mode (which is typically used when unprivileged
> user namespaces are not supported) and the support of unprivileged user
> namespaces.
> 
> Also update indentation of hash file (two spaces)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/bubblewrap/bubblewrap.hash | 4 ++--
>  package/bubblewrap/bubblewrap.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
