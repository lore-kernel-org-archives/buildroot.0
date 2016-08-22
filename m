From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Aug 2016 16:36:29 +0200
Subject: [Buildroot] [PATCH 1/2] board/pc/readme.txt: fix output image
 name
In-Reply-To: <20160822015216.425-1-nunes.erico@gmail.com>
References: <20160822015216.425-1-nunes.erico@gmail.com>
Message-ID: <20160822163629.460cd190@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 22 Aug 2016 03:52:15 +0200, Erico Nunes wrote:
> The instructions listed sdcard.img as output image name but
> board/pc/genimage-*.cfg generate it named as disk.img instead.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  board/pc/readme.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
