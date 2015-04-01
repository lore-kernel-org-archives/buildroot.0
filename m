From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 1 Apr 2015 20:05:14 +0200
Subject: [Buildroot] [PATCH] cairo: bump to version 1.14.2
In-Reply-To: <1427849500-914-1-git-send-email-gustavo@zacarias.com.ar>
References: <1427849500-914-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150401200514.39c9953b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 31 Mar 2015 21:51:40 -0300, Gustavo Zacarias wrote:
> Add hash file and remove upstream patches.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/cairo/0002-openvg-build-fix.patch   | 28 ----------------------------
>  package/cairo/0004-fix-nofork-any2ppm.patch | 23 -----------------------
>  package/cairo/cairo.hash                    |  2 ++
>  package/cairo/cairo.mk                      |  2 +-
>  4 files changed, 3 insertions(+), 52 deletions(-)
>  delete mode 100644 package/cairo/0002-openvg-build-fix.patch
>  delete mode 100644 package/cairo/0004-fix-nofork-any2ppm.patch
>  create mode 100644 package/cairo/cairo.hash

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
