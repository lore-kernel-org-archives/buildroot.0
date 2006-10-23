From: Bernhard Fischer <rep.nop@aon.at>
Date: Mon, 23 Oct 2006 14:10:27 +0200
Subject: [Buildroot] make: *** No rule to make target `linux',
	needed by `pcmcia'. Stop.
In-Reply-To: <1161601256.31399.4.camel@benakiva-laptop>
References: <1161601256.31399.4.camel@benakiva-laptop>
Message-ID: <20061023121027.GB13298@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 23, 2006 at 01:00:56PM +0200, Itzhak Ben-Akiva wrote:
>Hi all,
>
>Now, after compiling busybox successfully, the compilation falls in
>make: *** No rule to make target `linux', needed by `pcmcia'. Stop.
>
>I compiled buildroot successfully on 15/Oct/2006 without such an error.
>Currently, I'm building the toolchain (gcc-4.1.1, binutils-2.17, linux
>kernel header 2.6.18)

kernel-headers 2.6.18 are experimental. That said, did you enable a
kernel for your device?

>
>Any help is welcomed.

I don't use the pcmcia package and use a generic x86 kernel that is not
checked into svn, so i can't really help you, sorry.
