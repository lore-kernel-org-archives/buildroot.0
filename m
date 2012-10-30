From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 30 Oct 2012 20:30:42 +0200
Subject: [Buildroot] Inconsistent kallsyms data error on ARM
In-Reply-To: <1351536890.13635.11.camel@Homeserver>
References: <1351536890.13635.11.camel@Homeserver>
Message-ID: <20121030183041.GB4690@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Chris,

On Mon, Oct 29, 2012 at 02:54:50PM -0400, Chris Wilkinson wrote:
> I intermittently get the below error on ARM/EM7210 after make clean,
> make.
> 
> In  the past it has gone away following config changes but I was never
> able to isolate just what buildroot or kernel config changes were
> responsible.
> 
> What would cause this?
> 
> chrisw at Homeserver:~/embedded/buildroot-2012.08$ make

[...]

> Inconsistent kallsyms data

Try the patch at http://git.kernel.org/linus/9973290ce. This patch is included 
in kernel version 3.5, but didn't make it into the stable series.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
