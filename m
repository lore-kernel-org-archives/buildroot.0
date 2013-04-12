From: Sonic Zhang <sonic.adi@gmail.com>
Date: Fri, 12 Apr 2013 13:01:02 +0800
Subject: [Buildroot] [PATCH v3 1/7] arch: toolchain: Introduce binary
	formats BINFMT_*.
In-Reply-To: <CAJxxZ0OgXiikacroFj-fbe=wvNR5npxX9f0q13jnMdeNkOTURA@mail.gmail.com>
References: <1365488988-21604-1-git-send-email-sonic.adi@gmail.com>
 <516502AD.5080104@mind.be>
 <CAJxxZ0OgXiikacroFj-fbe=wvNR5npxX9f0q13jnMdeNkOTURA@mail.gmail.com>
Message-ID: <CAJxxZ0OSPXhD-trQLXadrA-kcGhe=jnz-=3Gsmfg+3SwupfgtA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout and Thomas,


Could you give me a conclusion on which way do you prefer to define
the macro BINFMT_XXX? Generic for all architectures or depend on
BR2_bfin and BR2_m68k only?


Thanks

Sonic
