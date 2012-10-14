From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Mon, 15 Oct 2012 00:10:19 +0200
Subject: [Buildroot] Confused by the <fenv> implementation,
	causing gsl build issues
In-Reply-To: <20121014120429.52067fdc@skate>
Message-ID: <13a6153e698.7e7.2760.rep.dot.nop@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14 October 2012 12:04:29 Thomas Petazzoni 
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> uClibc provides a UCLIBC_HAS_FENV option that can be enabled on any
> architecture.

Fenv is IIRC only implemented for i386.


Sent with AquaMail for Android
http://www.aqua-mail.com
