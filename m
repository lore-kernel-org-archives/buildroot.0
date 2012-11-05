From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Mon, 5 Nov 2012 06:53:43 +0100
Subject: [Buildroot] new perl build issue
References: <CABtOAfw6A4jH1h1W1Bbm7kKsmz_hJLymP8JRBo5A6a4o09wS8g@mail.gmail.com>
 <CAB0FRstkx1+Eg0WTv4eVJ+KPFX9RY2C8X4SaL0EDoBK0P642SQ@mail.gmail.com>
Message-ID: <79k77k.41a.ln@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fran?ois Perrad <francois.perrad@gadz.org> wrote in
news:CAB0FRstkx1+Eg0WTv4eVJ+KPFX9RY2C8X4SaL0EDoBK0P642SQ at mail.gmail.com: 

> this afternoon, Thomas has posted 3 patches for qemu (see
> http://patchwork.ozlabs.org/patch/197055/).

Hi,

I needed to add libglib2 to QEMU_DEPENDENCIES to get host-qemu compiled. 
Furthermore the patch did not fix my compile problem, the qemu still happens:

qemu: Unsupported syscall: 240

Kind regards, Bernd
