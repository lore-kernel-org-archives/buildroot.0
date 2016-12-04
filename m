From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 23:53:06 +0100
Subject: [Buildroot] [PATCH 3/3] qextserialport: remove redundant patch
 0001-gui
In-Reply-To: <20161124223747.31342-3-arnout@mind.be>
References: <20161124223747.31342-1-arnout@mind.be>
 <20161124223747.31342-3-arnout@mind.be>
Message-ID: <20161204235306.3d1cccc5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Nov 2016 23:37:47 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> The same thing was done in upstream commit 220d7a2f "QtGui module only
> needed by Windows", though it was done differently upstream.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> This one is probably for next (though it depends on the other 2, so only
> apply after the merge).
> ---
>  ...0001-Create-a-main-include-file-QExtSerialPort.patch} |  0
>  package/qextserialport/0001-gui.patch                    | 16 ----------------
>  ...make-to-add-a-pkgconfig-file-to-ease-usage-wit.patch} |  0
>  3 files changed, 16 deletions(-)
>  rename package/qextserialport/{0002-Create-a-main-include-file-QExtSerialPort.patch => 0001-Create-a-main-include-file-QExtSerialPort.patch} (100%)
>  delete mode 100644 package/qextserialport/0001-gui.patch
>  rename package/qextserialport/{0003-Tell-qmake-to-add-a-pkgconfig-file-to-ease-usage-wit.patch => 0002-Tell-qmake-to-add-a-pkgconfig-file-to-ease-usage-wit.patch} (100%)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
