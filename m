From: andrew colin <andrew.colin@gmail.com>
Date: Tue, 17 Apr 2007 07:51:04 +0200
Subject: [Buildroot] Buildroot for x86
In-Reply-To: <20070416192559.GH23570@aon.at>
References: <4623B972.6050109@teamboyce.co.uk> <20070416192559.GH23570@aon.at>
Message-ID: <31da51d50704162251t3af47152jef9b0ab77fc66c7a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

Busybox-1.5.0
Gcc-4.1.2
binutils-2.17

Work for me perfectly prior to the release of busybox-1.5.0 version
1.4.1 worked as well.

On 4/16/07, Bernhard Fischer <rep.dot.nop@gmail.com> wrote:
> On Mon, Apr 16, 2007 at 06:59:14PM +0100, Rod Boyce wrote:
> >
> >All,
> >
> >I have quite new to buildroot but not embedded systems or Linux.
> >Although I have never use x86 as an embedded target until now.  I can
> >build a working kernel with the buildroot system but do not seem to be
> >able to get busybox to finish the system startup unless I build busybox
> >with my FC5 host compiler.  Can anybody suggest what version of GCC &
> >binutils I should be using to produce a working busybox execautable for
> >x86.  Or maybe I'm missing something that I don't need on other processors.
>
> I usually use the "minimal busybox target skeleton" and busybox from
> trunk (1.5.0 may work too, didn't try it, though). I use gcc-4.2 from
> the branch (4.1.2 is supposed to work too) and current binutils.
>
> Since you didn't paste any error, let me point you to
> docs/README
> for further information on how to configure busybox, uClibc and a
> kernel yourself.
>
> HTH,
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>


-- 
"Dru"
To follow the path, look to the master, follow the master, walk with
the master, see through the master, become the master. (zen)
