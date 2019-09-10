From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Sep 2019 18:56:00 +0200
Subject: [Buildroot] Buildroot stops during the boot
In-Reply-To: <CAHcxfMs9=jERi5t5fxth8U+Q9X50YvzDipOg43CpSa-wKWhQPw@mail.gmail.com>
References: <CAHcxfMs9=jERi5t5fxth8U+Q9X50YvzDipOg43CpSa-wKWhQPw@mail.gmail.com>
Message-ID: <20190910185600.6d4541dd@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Sep 2019 16:13:43 +0200
Cristian Basile <cristian.basile1997@gmail.com> wrote:

>  Dears,
> I can build, but i have a problem during boot.
> I attach the kernel configuration.
> The system stops at this point: https://imageshack.com/i/pnb4yGh3j
> Could you tell me why?

No, because there is not enough logs, you only have a few lines about
USB devices appearing, the interesting part is before. As I told you
privately, you really need to hook up a serial port, so that you can
get the entire boot log.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
