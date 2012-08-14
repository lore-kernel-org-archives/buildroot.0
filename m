From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Tue, 14 Aug 2012 13:15:30 -0400
Subject: [Buildroot]  [PATCH 11/36] package/qemu: new package
Message-ID: <CADiAo4+W4ofccqAnjaT3XmJxboa9=CuOd8Lv2SQMcBzq7hCVPA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Yann Morin wrote:

>> Just curious, what's the use case for Qemu on the target? I would have
>> seen Qemu as something useful on the host, but on the target?

> I want to build a libvirt-based system to host VMs, and I do not want
> to use a complete distro for that : I do not care about the handy-dandy

I'd like to support the ideas to include more server-like and
desktop-like packages into Buildroot: it is a great tool to build a
custom root filesystem far beyond the needs of embedded systems and
micro-controllers. This is the same reason why I am proposing
linux-pam and systemd  (and not only me for the latter) for Buildroot.

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
