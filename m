From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 9 Feb 2013 13:01:04 +0100
Subject: [Buildroot] [PATCH] aircrack-ng: new package
In-Reply-To: <511636E3.5010909@petroprogram.com>
References: <1360340189-4409-1-git-send-email-laurent.cans@gmail.com>
 <511525D1.8010305@petroprogram.com>
 <CAA1eMkEu3DZTbtgjZgq3538N5dyE5g84NDDL4_ay6OQ7Ek4-eA@mail.gmail.com>
 <511634BB.4000506@petroprogram.com>
 <511636E3.5010909@petroprogram.com>
Message-ID: <20130209130104.50bd9c14@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Stefan Fr?berg,

On Sat, 09 Feb 2013 13:45:39 +0200, Stefan Fr?berg wrote:

> Ah, but now I see it.
> That -Werror thing.
> I always define -Wno-error in my buildroot CFLAGS because
> I hate it when people think that their code is perfect (it newer is,
> and neither is my code) and
> stop compiling because warnings.
> That's why my compilationg with 4.5 succeeded.

Indeed, if the reason the compilation fails is because of -Werror, then
remove -Werror from the compilation flags, and use the stable 1.1
release rather than the SVN version.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
