From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2016 21:42:44 +0100
Subject: [Buildroot] [PATCH next] olimex_imx233_olinuxino: split
 defconfig in 2 variants
In-Reply-To: <CAB0FRsujkKYK5D0FM=PkhUW3-ruE2RtGpavCxP2S+35OG37A2g@mail.gmail.com>
References: <1478941453-1904-1-git-send-email-francois.perrad@gadz.org>
 <CAOMZO5DT0Fjw6tzoW0WJMg-YiH2Ns+3dgrcz0tGxH5YDk+__Fw@mail.gmail.com>
 <CAB0FRsujkKYK5D0FM=PkhUW3-ruE2RtGpavCxP2S+35OG37A2g@mail.gmail.com>
Message-ID: <20161113214244.111d812f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Nov 2016 15:09:51 +0100, Fran?ois Perrad wrote:

> My rational is:
> - The Wifi part is annoying for me because I cannot test it.

Why? Isn't the Wifi built-in?

> - olimex_imx233_olinuxino_maxi_defconfig is really as minimal as possible
> (see policy in https://buildroot.org/downloads/manual/manual.html#adding-board-support)
> and I could maintain (and test) it.

Using the name "maxi" for a defconfig that is in fact "as minimal as
possible" is very weird.

We generally try to provide support for the HW that is available on the
board, so if Wifi is available, it's good to have it supported in our
defconfig. I don't think two defconfigs are really useful in this
situation.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
