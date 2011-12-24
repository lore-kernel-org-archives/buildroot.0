From: Sergio Prado <sergiosiena@gmail.com>
Date: Fri, 23 Dec 2011 23:32:41 -0200
Subject: [Buildroot] [PATCH] Xorg and Tslib
In-Reply-To: <201112231637.59428.minimod@morethan.org>
References: <CAKm6Z3Vnevex7hjJo7DxQRX_pnS6L1foeih=m=cQgttG7ZeaNQ@mail.gmail.com>
 <CAKm6Z3UVRFhfa68gRWXu0Oj1UD0vGh6T0p93uL8C=r2xt_ijgQ@mail.gmail.com>
 <201112231637.59428.minimod@morethan.org>
Message-ID: <CAKm6Z3UUdheT6au=gkQRx8jGeAtuzRejU+u3C9GGkXdyy5rqAQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for the feedback Michael.

I totally agree that plain text is much better for patches. The problem is
that Gmail wraps lines somewhere around 80 characters, as you can see from
my first email, and the patch gets all messed up.

I search everywhere in the Gmail configuration and Google forums, and I did
not find a way (yet) to disable it.

Anyway, here is the patch again, with the change you suggest:

---
 package/x11r7/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 50816f2..664226f 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -174,6 +174,7 @@ endmenu
  source package/x11r7/xdriver_xf86-input-keyboard/Config.in
  source package/x11r7/xdriver_xf86-input-mouse/Config.in
  source package/x11r7/xdriver_xf86-input-synaptics/Config.in
+ source package/x11r7/xdriver_xf86-input-tslib/Config.in
  source package/x11r7/xdriver_xf86-input-vmmouse/Config.in
  source package/x11r7/xdriver_xf86-input-void/Config.in
  source package/x11r7/xdriver_xf86-video-apm/Config.in
-- 
1.7.1
