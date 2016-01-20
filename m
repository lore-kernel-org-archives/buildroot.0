From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 20 Jan 2016 15:18:55 +0100
Subject: [Buildroot] Building a Linux from scratch and new target
	architecture
In-Reply-To: <1453201429564-122990.post@n4.nabble.com>
References: <1453201429564-122990.post@n4.nabble.com>
Message-ID: <CAAXf6LULhmtpM3ncZwK=wFa+VPBh5=GE39M0X7Jc8bw1R81i8A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Md.Rashedul Amin Rony,

On Tue, Jan 19, 2016 at 12:03 PM, ronyboss <md.rashedul.amin@gmail.com> wrote:
> Hello,
>
> Recently I have been working with buildroot system and openwrt system. I
> have successfully build the linux for raspberry pi and other different
> routers with my own modifications. Now I want to learn how to add custom
> Target architecture, how to add kernel for them and how to tweek rootfs, and
> how to tweek file system and others.
>
> So it would be helpful for me if anyone can provide me some information
> about these things.
>

Have you seen the Buildroot manual? I think it can be a good starting
point on some of these topics:
http://buildroot.uclibc.org/downloads/manual/manual.html

In particular, you may be interested in chapters
"Project-specific customization"
http://buildroot.uclibc.org/downloads/manual/manual.html#customize
"Adding board support"
http://buildroot.uclibc.org/downloads/manual/manual.html#adding-board-support

Best regards,
Thomas
