From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 20:49:22 +0200
Subject: [Buildroot] [PATCH 2/3] package/network-manager: Now needs
 libgudev under systemd
In-Reply-To: <1440431056-25983-2-git-send-email-nroach44@gmail.com>
References: <1440431056-25983-1-git-send-email-nroach44@gmail.com>
 <1440431056-25983-2-git-send-email-nroach44@gmail.com>
Message-ID: <20150825204922.184f1297@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nathaniel Roach,

On Mon, 24 Aug 2015 23:44:15 +0800, Nathaniel Roach wrote:
> NetworkManager uses code (originally from udev) that has since
> 	been split from the main systemd codebase into libgudev.
> 
> Tweak the package files for NetworkManager to require libgudev
> 	when building with systemd.
> 
> Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
> ---
>  package/network-manager/Config.in          | 1 +
>  package/network-manager/network-manager.mk | 4 ++++
>  2 files changed, 5 insertions(+)

I've removed the tabs in the second lines of each paragraph in the
commit log, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
