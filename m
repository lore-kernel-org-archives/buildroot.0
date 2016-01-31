From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 31 Jan 2016 21:34:38 +0200
Subject: [Buildroot] [PATCH 1/2] package/gpsd: bump version to 3.16
In-Reply-To: <1454256656-9253-1-git-send-email-bernd.kuhls@t-online.de>
References: <1454256656-9253-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160131193438.GA2442@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Sun, Jan 31, 2016 at 05:10:55PM +0100, Bernd Kuhls wrote:
> Removed patch applied upstream:
> http://git.savannah.gnu.org/cgit/gpsd.git/commit/?id=3e25e2167beb3936de3986fad9b6c9bdec82b81f

The patch 0001-Fix-build-against-musl-libc.patch is also not needed anymore. 
Upstream commit 95c99f69e026 (Remove a BSD-ism., 2015-06-23) fixed this issue 
in a better way.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
