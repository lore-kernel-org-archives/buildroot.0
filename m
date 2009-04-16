From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 16 Apr 2009 20:02:47 -0300
Subject: [Buildroot] A new QTOPIA error
In-Reply-To: <26fbce020904161302x7e94966bsa77c2981c308908a@mail.gmail.com>
References: <26fbce020904141244l627cf9a8udc8af0cc80af2148@mail.gmail.com>
	<26fbce020904161302x7e94966bsa77c2981c308908a@mail.gmail.com>
Message-ID: <d6cda7730904161602o50047f0ei1fea9c0dc51b26f0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


On Thu, Apr 16, 2009 at 5:02 PM, Luciano Greiner
<luciano.greiner@gmail.com> wrote:
> Nobody but me with QTOPIA compilation errors? I tryed to change host 3
> times, and the same happens.
>

   I'm sorry to say, but I guess yeah. It builds and works quite
nicely on AVR32 target, built from a Gentoo host. The only part that I
know isn't working is xmlpatterns module because it crashes the AVR32
toolchain, but that's a problem with Atmel's patches, plus, it's not
even enabled by default.

  If you could post your .config, I can give it a try here.

Kind Regards,
   Thiago A. Correa
