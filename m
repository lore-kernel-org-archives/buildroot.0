From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Jul 2017 15:18:05 +0200
Subject: [Buildroot] /etc//init.d init scripts in buildroot
In-Reply-To: <87shhzb3d1.fsf@dell.be.48ers.dk>
References: <CALtfCQZAis0fX+J6NWTX+u=ZJB-0ZKoKgkBcteAJU4f+c46BJA@mail.gmail.com>
 <87shhzb3d1.fsf@dell.be.48ers.dk>
Message-ID: <20170714151805.20514430@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 14 Jul 2017 14:38:18 +0200, Peter Korsgaard wrote:

> If this is not good enough then you need to handle the gpio in a kernel
> driver instead by registering a reboot notifier.

What about using the gpio-poweroff driver, which already exists in the
kernel ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
