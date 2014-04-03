From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 20:20:06 +0200
Subject: [Buildroot] [PATCHv2] pptp-linux: bump to version 1.8.0
In-Reply-To: <1396300329-12942-1-git-send-email-gustavo@zacarias.com.ar>
References: <1396300329-12942-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140403202006.459f9e43@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 31 Mar 2014 18:12:09 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  .../pptp-linux/pptp-linux-001-susv3-legacy.patch   | 43 +++++++++++----------
>  .../pptp-linux/pptp-linux-002-drop-stropts.patch   | 26 -------------
>  ...tch => pptp-linux-002-fix-parallel-build.patch} |  0
>  package/pptp-linux/pptp-linux-003-ip-path.patch    | 44 ----------------------
>  package/pptp-linux/pptp-linux.mk                   |  5 ++-
>  5 files changed, 27 insertions(+), 91 deletions(-)
>  delete mode 100644 package/pptp-linux/pptp-linux-002-drop-stropts.patch
>  rename package/pptp-linux/{pptp-linux-004-fix-parallel-build.patch => pptp-linux-002-fix-parallel-build.patch} (100%)
>  delete mode 100644 package/pptp-linux/pptp-linux-003-ip-path.patch

Applied, thanks.

Would however be good to have a small changelog when you send two
consecutive versions, as well as more details about the updates in the
patches when they are non-trivial as is the case here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
