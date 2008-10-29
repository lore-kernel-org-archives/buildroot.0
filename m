From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 29 Oct 2008 14:01:33 -0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
In-Reply-To: <873aif2zqq.fsf@macbook.be.48ers.dk>
References: <20081028094026.563A73C671@busybox.net>
	<061E11D86E3DFF459604DF5B36F0805F1BA6D0@salka01.valka.local>
	<873aif2zqq.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730810290901m5b306270t5025ac987c846128@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 29, 2008 at 1:21 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Arnar" == Arnar Mar Sigur?sson <antab@valka.is> writes:
>
> Hi,
>
>  Arnar> This breaks building Qt for AVR32. It will force qmake to be
>  Arnar> build for the target so its unusable later on.
>
> Ok, I don't do Qt nor AVR32 - Markus, Thomas?
>

I didn't try it either myself yet as I'm kind busy working on some
other stuff, but the patch seams ok to me.
I do quite a bit of AVR32 and Qt. The sed just edits the qmake.conf
that qmake uses to generate the makefiles for qt and applications that
use it. qmake itself is usually built using a simpler Makefile to go
around the chicken egg issue.

The PKG_CONFIG_SYSROOT part is that I'm not quite sure. Is that the
part that breaks it Amar?

Kind Regards,
    Thiago A. Correa
