From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:37:55 +0200
Subject: [Buildroot] [PATCH] openvmtools: disable -Werror
In-Reply-To: <1410792995-28405-1-git-send-email-kaszak@gmail.com>
References: <1410792995-28405-1-git-send-email-kaszak@gmail.com>
Message-ID: <20140921193755.357d35b1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Karoly Kasza,

On Mon, 15 Sep 2014 16:56:35 +0200, Karoly Kasza wrote:
> Disable the mandatory flag -Werror in configure.ac.
> This also makes -Wno-deprecated-declarations flag unnecessary.
> 
> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
> ---
>  .../openvmtools/openvmtools-04-no_cflags_werror.patch |   17 +++++++++++++++++
>  package/openvmtools/openvmtools.mk                    |    4 ----
>  2 files changed, 17 insertions(+), 4 deletions(-)
>  create mode 100644 package/openvmtools/openvmtools-04-no_cflags_werror.patch

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
