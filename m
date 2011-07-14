From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Thu, 14 Jul 2011 11:38:08 +0100
Subject: [Buildroot] [git commit] linux: add support for 3.x and -rc
	versions
Message-ID: <CAAu5YTYMPwyV_TPx+AsnSWecaQEuxzn2yGSN1pTfLfXfg=hWYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14 I?il 2011 11:29, "Peter Korsgaard" <jacmet@uclibc.org> wrote:

>  Sven> linux/linux.mk:26: *** Recursive variable `LINUX_SITE' references
itself
...
> I think we can simply replace one of the '=' with a := to break the
> loop, but would like to be able to reproduce it first.

Or += if you want to avoid :=.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110714/eac94f30/attachment.html>
