From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Nov 2020 11:10:24 +0100
Subject: [Buildroot] [PATCH] package/qt5/qt5base: fix imx6 eglfs support
 with imx-gpu-viv
In-Reply-To: <20201027142833.1138548-1-gary.bisson@boundarydevices.com> (Gary
 Bisson's message of "Tue, 27 Oct 2020 15:28:33 +0100")
References: <20201027142833.1138548-1-gary.bisson@boundarydevices.com>
Message-ID: <87blge92en.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gary" == Gary Bisson <gary.bisson@boundarydevices.com> writes:

 > Last commit fixed eglfs_kms support for i.MX8 platforms that required to
 > declare imx-gpu-viv as the gbm provider.
 > However, this broke the eglfs "fbdev" imx6 support as gbm isn't provided
 > in this case. So limit the gbm option to imx-gpu-viv when wayland
 > backend is used only.

 > Fixes: 82fb51d3b5 ("package/qt5/qt5base: allow to use imx-gpu-viv as GBM
 > provider")

 > Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

Committed to 2020.02.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
