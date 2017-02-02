From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 2 Feb 2017 08:35:19 +0200
Subject: [Buildroot] [PATCH] uclibc: update to 1.0.22
In-Reply-To: <20170202061653.GA20021@waldemar-brodkorb.de>
References: <20170202061653.GA20021@waldemar-brodkorb.de>
Message-ID: <20170202063519.b5lzlk3wvyjqmzwb@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

On Thu, Feb 02, 2017 at 07:16:53AM +0100, Waldemar Brodkorb wrote:
> - fixes mips{32,64}r6 support
> - adds experimental aarch64 support

Is there any issue blocking enable of uclibc for BR2_aarch64?

> - fixes syscalls with 6 arguments for x86
> - removes PID caching and simplifies architecture specific code
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
