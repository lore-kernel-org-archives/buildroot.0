From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 8 Apr 2009 12:09:17 -0300
Subject: [Buildroot] u-boot fails with custom board support
In-Reply-To: <49DCAFCE.4030001@cogeco.ca>
References: <49DCAFCE.4030001@cogeco.ca>
Message-ID: <d6cda7730904080809i60285474o2517a57de6019aa5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mike,

On Wed, Apr 8, 2009 at 11:08 AM, mike sander <msander@cogeco.ca> wrote:
> /usr/bin/make -C board/atmel/xx/
> make: Entering an unknown directory
> make: *** board/atmel/xx/: No such file or directory. ?Stop.
> make: Leaving an unknown directory
> make[1]: *** [board/atmel/xx/libxx.a] Error 2
> make[1]: Leaving directory
> `/home/br/buildroot/project_build_arm/xx/u-boot-2009.03'
> make: ***
> [/home/br/buildroot/project_build_arm/xx/u-boot-2009.03/u-boot.bin] Error 2

   Are you sure it's the same u-boot sources? AFAIK, Atmel didn't push
u-boot patches to upstream, and therefore it were using a prepatched
u-boot that was comming from somewhere else. That's the reason we have
different u-boot versions and special handling for ARM.
  This might have change since I last saw it though as I don't use ARM myself.

Kind Regards,
   Thiago A. Correa
