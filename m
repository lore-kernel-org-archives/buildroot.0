From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 12 Mar 2009 21:01:16 -0300
Subject: [Buildroot] buildroot configuration files
In-Reply-To: <49B91AF1.8070409@yahoo.fr>
References: <49B91AF1.8070409@yahoo.fr>
Message-ID: <d6cda7730903121701k11f4d19aha42d1598f87ba55d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Mar 12, 2009 at 11:23 AM, Hichem Boussetta
<boussettahichem@yahoo.fr> wrote:
> Hi everyone,
>
> I am searching for some basic buildroot configuration files for different
> architectures (arm, mips, powerpc, sparc...).
> If someone got any of them in his hands, please send them to me.
>

  There are several in buildroot already.
  Just find ./target/ -name *_defconfig

  For example atngw100_defconfig is the default config for the Atmel
NGW100 AVR32 board.

Kind Regards,
   Thiago A. Correa
