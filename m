From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Thu, 29 Nov 2012 11:53:49 -0200
Subject: [Buildroot] Buildroot for avr32
In-Reply-To: <CAHt8ZCN5eB8shsxz+gVz6neYbwVC7kE-O=cT66MCTRQNq6o_qQ@mail.gmail.com>
References: <memo.20121129102031.4232H@postmaster+dexdyne.com.cix.co.uk>
 <20121129113710.63d5676c@skate>
 <CAHt8ZCN5eB8shsxz+gVz6neYbwVC7kE-O=cT66MCTRQNq6o_qQ@mail.gmail.com>
Message-ID: <CAExDhvbCb_Z8zuzDv_j3QPFbwD-g7-UeU0h+dCgUv4X9A2JKiw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Thu, Nov 29, 2012 at 9:35 AM, Simon Dawson <spdawson@gmail.com> wrote:
>
> I'm using mainline Buildroot for a custom board that is based on the
> Atmel NGW100 board, with an ap7000 processor. I haven't had any major
> problems; I've had to patch the 3.6.x mainline kernel to get the board
> to boot from SD card --- I'm not using any Atmel kernel patches.
>

Same here. I think our u-boot is from atmel, the rest is mainline,
including buildroot. Haven't tried any new buildroot releases thou. We
have moved to ARM but we still have several AVR32's in the field.

Kind Regards,
     Thiago A. Correa
