From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 02 Jun 2016 21:47:19 +0200
Subject: [Buildroot] Tossing coins on Beaglebone Black kernel version
In-Reply-To: <CAAEAJfAnjZzOo2hZG4h=-_2mpZmqb3BUf=fkNLc08zdR9ePVWA@mail.gmail.com>
 (Ezequiel Garcia's message of "Thu, 2 Jun 2016 12:54:26 -0300")
References: <CAAEAJfAnjZzOo2hZG4h=-_2mpZmqb3BUf=fkNLc08zdR9ePVWA@mail.gmail.com>
Message-ID: <87wpm7s794.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ezequiel" == Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:

 > As mentioned on IRC, beaglebone_defconfig U-Boot build is currently broken.
 > I don't think the error matters much, given the selected U-Boot version
 > is really old.

Yeah, our beaglebone defconfig could really use some love. It looks like
I will be getting a beaglebone green wireless so I was planning on
looking into it as well, but thanks for working on it!

 > We are currently using git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
 > while TI kernel release [1] notes are pointing at
 > git://git.ti.com/processor-sdk/processor-sdk-linux.git.

 > Now, I'm not all that sure which kernel we want to use by default and that's
 > why I'm asking here, to hear what the rest thinks.

What are the beaglebone people using for their official images? Can't we
use the same?


 > FWIW, I commercially support a AM335x product and we've switched to
 > linux mainline,
 > long, long time ago, because the SDK was incredibly crappy at that time.

Yeah, that would be my choice as well for a product. For getting started
on a beaglebone I'm less sure as mainline doesn't have any support for
the various capes.

-- 
Bye, Peter Korsgaard
