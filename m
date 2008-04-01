From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 1 Apr 2008 09:24:11 +0200
Subject: [Buildroot] Solution to "unsupported combination: -mabicalls
	-mabi=eabi"
In-Reply-To: <10836543.1911551207033969392.JavaMail.nabble@isper.nabble.com>
References: <10836543.1911551207033969392.JavaMail.nabble@isper.nabble.com>
Message-ID: <20080401072410.GA28933@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 01, 2008 at 12:12:49AM -0700, carl.hakenas at gmail.com wrote:
>Hello,
>
>I noticed that you answered a post at http://www.nabble.com/error-when-building-gcc-using-buildroot-toolchain-td13487091.html
>
>I have the same problem did you find a solution for this?
>
>Thank you very much in advance!!!

MIPS and arm (and SH, i386, x86-64) work fine for me in my repo. For ARM
i did only test EABI (i.e. i do not do ARM OABI and most likely never
will).

HTH
