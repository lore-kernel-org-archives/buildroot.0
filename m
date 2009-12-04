From: Michael S. Zick <minimod@morethan.org>
Date: Fri, 4 Dec 2009 11:30:36 -0600
Subject: [Buildroot] using buildroot for mainstone board
In-Reply-To: <8955768b0912040825h4ddb6185s6a967151e97cb27@mail.gmail.com>
References: <8955768b0912040825h4ddb6185s6a967151e97cb27@mail.gmail.com>
Message-ID: <200912041130.38377.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri December 4 2009, Shivaprashanth Hiremath wrote:
> hi all
> i have mainstone board with pxa270 processor. i want to use buildroot to
> generated kernel and rootfs. anybody have idea?
>

The pxa270 is an Xscale processor, Xscale is based on an ARM core.
The Buildroot system has good support for ARM,
although I don't know if that includes your processor specifically.

It should be doable.

Mike
> please reply. i am very much new to this.
> thanks in advance
> 
> bye
> shivap
> 
