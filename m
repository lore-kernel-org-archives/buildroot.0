From: Alvaro Gamez <alvaro.gamez@hazent.com>
Date: Mon, 20 Feb 2012 09:26:49 +0100
Subject: [Buildroot] Dynaminc Component System for Buildroot
In-Reply-To: <CAMkyJgCC0i5t6j+M2VefDRVx_qjaRTHfOUOgnrSc9U+aHA91XQ@mail.gmail.com>
References: <CAMkyJgCC0i5t6j+M2VefDRVx_qjaRTHfOUOgnrSc9U+aHA91XQ@mail.gmail.com>
Message-ID: <CAM+bi4scx3d9AU4EHM4s3tdx-YXqZ7mC1Q4=Vc56AP89G5fVhw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I know some commercial software very similar to buildroot that works
somehow similar to your idea.
It is much simpler, though, because all it forces the embedded developer to
is to create a Makefile with the clean, distclean, all and install targets.
The last one just copies whatever it needs to work to the root directory of
the future root image.

It is pretty straightforward and really simplifies the workflow.

I'd like very much to see that or something like that in buildroot.

Regards

2012/2/20 Avishay Orpaz <avishorp@gmail.com>

> Hi
> I've been using buildroot for about two years for building embedded
> systems on various platforms. An embedded system usually comprises of a set
> of standard tool and custom software, scripts etc. Buildroot does great job
> on the first, but then I have to manually compile the project-specific
> software and install it in the target system created by buildroot. In order
> to make workflow smoother, I have an idea of adding a dynamic component
> support for buildroot. In such a system, buildroot, when invoked, will scan
> a specific directory for components. Components are directories with some
> distinguishing feature (a special file or so) which contains buildroot .mk
> file. Those components will appear on buildroot configuration menu, will
> use the regular compilation-installation infrastructure it provides and
> will be installed in the target filesystem as any other, out-of-the-box
> component.
>
> I'm willing to put time and effort into building such an extension, but I
> would really like to get some feedback before I start, and to estimate the
> chances it would be merged into the buildroot mainline.
>
> Avishay
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>



-- 
?lvaro G?mez Machado
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120220/21bb92b5/attachment.html>
