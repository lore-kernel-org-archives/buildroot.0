From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 3 May 2012 15:49:06 +0300
Subject: [Buildroot] read-edid package - clarifications
In-Reply-To: <CADiAo4K90x6ZANyvQk7SYP=o=YmimOHDn+wfHLSrwE7bumcLKA@mail.gmail.com>
References: <CADiAo4K90x6ZANyvQk7SYP=o=YmimOHDn+wfHLSrwE7bumcLKA@mail.gmail.com>
Message-ID: <20120503124906.GA7331@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dimitry,

On Thu, May 03, 2012 at 06:32:35AM -0400, Dimitry Golubovsky wrote:
> Baruch's comment:
> 
> > read-edid can only run on x86 PCs and PowerPC Macs, so it should depend on
> > (BR2_i386 || BR2_x86_64 || BR2_powerpc).
> 
> I only tested it on i386, not sure about x86-64, and definitely not on
> powerpc as it has x86 real-mode stuff in it. So perhaps I'll keep i386
> only.

read-edid seems to work perfectly on my x86_64 laptop. So keeping BR2_x86_64 
should be safe.

As for PowerPC, I guess the low level code is selected at build time according 
to the target platform. I haven't looked at the code, though.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
