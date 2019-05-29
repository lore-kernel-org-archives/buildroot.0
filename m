From: Guo Ren <guoren@kernel.org>
Date: Wed, 29 May 2019 20:34:34 +0800
Subject: [Buildroot] [PATCH V3 01/10] arch/csky: Use VDSP instead of DSP
In-Reply-To: <20190529135836.1a907b0e@windsurf.home>
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
 <1559114328-23357-2-git-send-email-guoren@kernel.org>
 <20190529092128.36183371@windsurf.home>
 <CAJF2gTQC8UigBniC_RKUVFddX=PnN7O9GyBZXcxyXuPBg9WNHw@mail.gmail.com>
 <20190529095629.2b28cbb7@windsurf.home>
 <CAJF2gTT5N6ST9Ph-L+bX2WtNx4ENu0wQ2uQ63D=3C-Zqoit+3w@mail.gmail.com>
 <20190529103824.58560e4e@windsurf.home>
 <CAJF2gTQfu_FAck2YM5b=d8QaYQhBHoCSeG4tvL1i8a1=7vgofA@mail.gmail.com>
 <20190529112317.08fe1013@windsurf.home>
 <CAJF2gTRf_kzuqM_takvwNHU3sBfTBjqOBDv4xbqwnS9E9f9uTQ@mail.gmail.com>
 <20190529135836.1a907b0e@windsurf.home>
Message-ID: <CAJF2gTS5V8tL-KbLCXt2O6bPp3GpEZKPuVv0Zv9OKArKGy3izQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 29, 2019 at 7:58 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Wed, 29 May 2019 17:45:19 +0800
> Guo Ren <guoren@kernel.org> wrote:
>
> > > I am willing to help you formulate this properly, but since I still
> > > don't understand why you are dropping the DSP option, I can't really
> > > help by proposing a better wording.
> > DSP extention is no longer used for C-SKY and there is no defconfig
> > use "e" extension in buildroot.
>
> Not having a defconfig doesn't mean something is not supported. There
> are tons of features in Buildroot that are not enabled by defconfig,
> and still we do support them.
Agree, remove defconfig sentence.

Best Regards
 Guo Ren
