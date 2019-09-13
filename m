From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 13 Sep 2019 19:32:08 +0200
Subject: [Buildroot] My Goodix touchscreen doesn't work!
In-Reply-To: <CAHcxfMv8pNd-gFEm4vSibEKQkJ55MjLNx5vH71KGbAOWZ+_aYA@mail.gmail.com>
References: <CAHcxfMv8pNd-gFEm4vSibEKQkJ55MjLNx5vH71KGbAOWZ+_aYA@mail.gmail.com>
Message-ID: <20190913193208.51cae8d0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Cristian,

On Fri, 13 Sep 2019 10:09:08 +0200
Cristian Basile <cristian.basile1997@gmail.com> wrote:

> I have a problem with the touchscreen of Lattepanda board display.
> The touchscreen doesn't work.
> However, the driver is loaded and the device recognized.
> What is the problem?
> I attached the kernel configuration.

As much as the Buildroot community would like to help, I believe it is
worth pointing out that this problem is not Builroot related. It is
related to your hardware platform and its kernel support. You should
either get support from your hardware vendor and/or the kernel
community (if you're using a recent upstream Linux kernel).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
