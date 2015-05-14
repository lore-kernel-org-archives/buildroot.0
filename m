From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 14 May 2015 06:37:23 +0300
Subject: [Buildroot] [PATCH v2 8/9] atmel: add a flashing helper and
 documentation
In-Reply-To: <1431544977-2274-9-git-send-email-alexandre.belloni@free-electrons.com>
References: <1431544977-2274-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1431544977-2274-9-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <20150514033723.GA2558@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Alexandre,

On Wed, May 13, 2015 at 09:22:56PM +0200, Alexandre Belloni wrote:
> +You can then flash the board using the provided flasher.sh script in board/atmel:
> +
> +board/atmel/flasher.sh <builddir_path> <interface> <board>
> +
> +For example:
> +board/atmel/flasher.sh /tmp/atmel_sama5d3_xplained/ /dev/ttyACM0 sama5d3_xplained

Since you didn't mention out of tree build in this document, I think 
'./output/' would be better as first argument example. Adding a comment on out 
of tree build would be nice, though.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
