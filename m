From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 3 May 2012 21:22:45 +0300
Subject: [Buildroot] read-edid package - clarifications
In-Reply-To: <CADiAo4J4T_bcDzospg7e9Hr_HvUJ8qGBegrda6BsUFrnzttx8A@mail.gmail.com>
References: <CADiAo4J4T_bcDzospg7e9Hr_HvUJ8qGBegrda6BsUFrnzttx8A@mail.gmail.com>
Message-ID: <20120503182245.GB2763@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Dimitry,

On Thu, May 03, 2012 at 09:27:05AM -0400, Dimitry Golubovsky wrote:
> Baruch Siach wrote:
> 
> > read-edid seems to work perfectly on my x86_64 laptop. So keeping BR2_x86_64
> > should be safe.
> 
> OK, if you tried what I submitted then I'll add x86_64 (I just do not
> have a hardware to test it such way).

No I haven't tested your patch. I just run 'get-edid | parse-edid' from the 
read-edid package of my distro (Debian).

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
