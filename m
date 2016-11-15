From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 15 Nov 2016 17:16:22 +0000
Subject: [Buildroot] [Rejected v2 1/7] qt5webkit: Get sources from
 Qt-5-unofficial-builds
In-Reply-To: <20161115171307.7499-2-corjon.j@ecagroup.com>
References: <1478601048-21388-1-git-send-email-anaumann@ultratronik.de>
 <20161115171307.7499-2-corjon.j@ecagroup.com>
Message-ID: <1479230128.10985.10.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

On Tue, 2016-11-15 at 18:13 +0100, Julien Corjon wrote:
> Instead of messing with git we may get tarballs of obsolete but still
> existing submodules as we used to but from a bit different location.
> 
> It turned out Qt people still create packages for obsolete submodules
> for so-called "unofficial builds", see [1].
> 
> [1] https://wiki.qt.io/Qt-5-unofficial-builds
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> ---
> ?package/qt5/qt5.mk???????????????????|??1 +
> ?package/qt5/qt5webkit/qt5webkit.hash |??4 ++--
> ?package/qt5/qt5webkit/qt5webkit.mk???| 14 +++-----------
> ?3 files changed, 6 insertions(+), 13 deletions(-)

I'm wondering what does this mean?
3 hours ago you sent email saying "Reviewed-by" and now reject?

-Alexey
