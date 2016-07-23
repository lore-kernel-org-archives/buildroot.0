From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jul 2016 15:08:43 +0200
Subject: [Buildroot] [PATCH] libinput: bump to version 1.4.0
In-Reply-To: <1469234892-560-1-git-send-email-gustavo@zacarias.com.ar>
References: <1469234892-560-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160723150843.798e7e67@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 22 Jul 2016 21:48:12 -0300, Gustavo Zacarias wrote:
> And drop upstream patch.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  ...-Add-configure.ac-check-for-static_assert.patch | 34 ----------------------
>  package/libinput/libinput.hash                     |  4 +--
>  package/libinput/libinput.mk                       |  4 +--
>  3 files changed, 3 insertions(+), 39 deletions(-)
>  delete mode 100644 package/libinput/0002-Add-configure.ac-check-for-static_assert.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
