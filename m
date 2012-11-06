From: Alexander Khryukin <alexander@mezon.ru>
Date: Tue, 6 Nov 2012 13:28:41 +0300
Subject: [Buildroot] [PATCH v11 2/9] perl: new package
In-Reply-To: <20121106080812.4e7bd01a@skate>
References: <1350652434-32020-1-git-send-email-francois.perrad@gadz.org>
 <1350652434-32020-2-git-send-email-francois.perrad@gadz.org>
 <upcp6k.3q9.ln@bernd-kuhls.de>
 <CAB0FRsvaWPoSfSOv1uyPjpzHMU4a_hxPF_jB4XEhuVUFg4KcSQ@mail.gmail.com>
 <50986270.4070804@mind.be> <20121106080812.4e7bd01a@skate>
Message-ID: <CABtOAfw7M5y9p7B1ObpNOqsjPVi5wjKpmRTe59dzRZRut7XbRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/11/6 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

>
> On Tue, 06 Nov 2012 02:05:52 +0100, Arnout Vandecappelle wrote:
>
> >   Is it possible that this is because the target binary is created with
> > kernel headers 3.2, but you're running it on a host which is only 2.6.32
> > (squeeze)?  But then it should work on wheezy, because that has 3.2 as
> > well (at least since about four months IIRC).  Although...  240 on i386
> > is futex, which has existed already since long before 2.6.32.
>
> Aaah, I didn't think about this problem. This is indeed going to be
> really annoying, if the kernel headers chosen for the target have to
> somewhat match the kernel version running on the host :-(
>
> I guess this whole qemu thing for Perl is going to be annoying on the
> long term. We might need to start looking for a different option, i.e
> seeing how to get Perl to build without needing qemu.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


I'm working in chroot. that includes headers from 3.6, but host-system is
CentOS 6.2
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121106/b5229cd9/attachment.html>
