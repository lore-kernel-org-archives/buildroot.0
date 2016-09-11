From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 21:51:48 +0200
Subject: [Buildroot] [PATCH] package/libusb: bump version to 1.0.20
In-Reply-To: <1473403109-26697-1-git-send-email-jer@airfi.aero>
References: <1473403109-26697-1-git-send-email-jer@airfi.aero>
Message-ID: <20160911215148.6fcbf80b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  9 Sep 2016 08:38:29 +0200, Jeroen Roovers wrote:
> 	Add a patch that should fix parallel make issues particular to
> 	this version and probably fixed in the next version.
> 
> Signed-off-by: Jeroen Roovers <jer@airfi.aero>
> ---
>  package/libusb/0001-parallel-make.patch | 159 ++++++++++++++++++++++++++++++++
>  package/libusb/libusb.hash              |   2 +-
>  package/libusb/libusb.mk                |   5 +-
>  3 files changed, 163 insertions(+), 3 deletions(-)
>  create mode 100644 package/libusb/0001-parallel-make.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
