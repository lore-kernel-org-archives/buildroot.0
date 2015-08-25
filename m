From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 20:49:28 +0200
Subject: [Buildroot] [PATCH 3/3] package/libmbim: Now needs libgudev
 under systemd
In-Reply-To: <1440431056-25983-3-git-send-email-nroach44@gmail.com>
References: <1440431056-25983-1-git-send-email-nroach44@gmail.com>
 <1440431056-25983-3-git-send-email-nroach44@gmail.com>
Message-ID: <20150825204928.491c0d94@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Nathaniel Roach,

On Mon, 24 Aug 2015 23:44:16 +0800, Nathaniel Roach wrote:
> libmbim uses code (originally from udev) that has since
> 	been split from the main systemd codebase into libgudev.
> 
> Fixes: http://autobuild.buildroot.org/results/638/638dbf05b785a276a33983b0237b7cad54777b85/
> 
> Tweak the package files for libmbim to require libgudev
> 	when building with systemd.
> 
> Signed-off-by: Nathaniel Roach <nroach44@gmail.com>
> ---
>  package/libmbim/Config.in  | 1 +
>  package/libmbim/libmbim.mk | 4 ++++
>  2 files changed, 5 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
