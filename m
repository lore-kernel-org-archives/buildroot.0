From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Oct 2017 15:50:28 +0200
Subject: [Buildroot] [BuildRoot] at91sam9x5ek_defconfig not booting
In-Reply-To: <CAHnuF33Z3qQeVr5o1q=K1+OgMDCEhheOQm9qCGO1TpPZrjbeVw@mail.gmail.com>
References: <CAHnuF31sDH93MRN8nU6kdvfymwD7LOAz56YckWrk-OLSdMx3Qg@mail.gmail.com>
 <20171012220111.301bb3af@windsurf.home>
 <CAHnuF30iK6AQeoZBn3f35q1B5Ff+SG9uGUywzKH--wPp-THVVg@mail.gmail.com>
 <CAHnuF33Z3qQeVr5o1q=K1+OgMDCEhheOQm9qCGO1TpPZrjbeVw@mail.gmail.com>
Message-ID: <20171013155028.77a75504@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 13 Oct 2017 09:44:06 -0300, Alejandro Ariel Fachini wrote:

> Thanks For your help. I used the tag 2017.03 and Still got the same Result

There is no 2017.03 tag, so this is not possible.

> in fact the first thing i did was use the latest version of BuildRoot.
>  If i understand correctly:
> At first Boot after Install binaries i should set environment variables,

No, the default environment variables set inside the U-Boot binary
should be good enough.

> How do I make the boot into Kernel auomatic? I believe all tthis is U-Boot
> Related? If thats so just tell me and i wont bother anymore.

This is all U-Boot related of course. Please read the materials that I
pointed in my previous e-mail. And as I said, the default U-Boot
environment should automatically load and boot a Linux kernel, if I
remember correctly.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
