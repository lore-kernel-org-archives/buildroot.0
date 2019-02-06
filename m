From: =?UTF-8?Q?Einar_J=C3=B3n?= <tolvupostur@gmail.com>
Date: Wed, 6 Feb 2019 14:38:20 +0100
Subject: [Buildroot] [Question] Glibc 2.27+ build and localedef
In-Reply-To: <20190205183306.0a563445@gmx.net>
References: <CABhNV20+Gv6n0hbNK81fNjOcOv3MOTOu_=SOVnZ3ikERo84nmA@mail.gmail.com>
 <20190205183306.0a563445@gmx.net>
Message-ID: <CABhNV22D7wtkCt+87fYv8-vG+M6eAnrqxfbQ=eGuVmCFuGVGtg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks for that.
Works like a charm.

I'm actually on 2018.08, but applying both patches (minus the glibc
version bump) did the trick for me.
Is there any reason why this is not in the mainline yet?

On Tue, 5 Feb 2019 at 18:33, Peter Seiderer <ps.report@gmx.net> wrote:
>
> >
> > Is this a known issue, or is it just me?
>
> Known issue, see e.g.:
>
> [RFC v2] localedef: update to glibc-2.28 and various fixes ([1])
>
> Regards,
> Peter
>
> [1] http://lists.busybox.net/pipermail/buildroot/2018-December/237991.html
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>

-- 
Regards
Einar J?n
