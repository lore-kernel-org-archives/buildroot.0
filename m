From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Wed, 14 Oct 2015 09:17:13 +0200
Subject: [Buildroot] docs/website: New website
In-Reply-To: <CA+TH9VmNdKfHr5v8-OteT6TLC8DK-HGshyUnbHgX_p+A2rW2=A@mail.gmail.com>
References: <CA+TH9VmNdKfHr5v8-OteT6TLC8DK-HGshyUnbHgX_p+A2rW2=A@mail.gmail.com>
Message-ID: <CAGduivyGchMyR4iXnxm3xniYoYLi7sq116=hjkmkOybVq+tifw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Angelo, all

On Tue, Oct 13, 2015 at 9:54 PM, Angelo Compagnucci <
angelo.compagnucci@gmail.com> wrote:

> This patch introduces a new buildroot website based on a modern
> flat layout inspired by material design.
> Each page of the old website is converted to the new css/layout,
> the big bump is in main page which is completely rewritten.
> Content of the old website is copied more or less verbatim,
> planning to add more content in the future.
>
> You can find a complete demo site here:
>
> http://angeloc.github.io
>
That's really neat ! Thanks a lot for your work. We now have a trully
modern web page.

>
> Unfortunately, this patch cannot be sent with git send-email, cause
> css and javascript minified files contains lines longer than the
> maximum smtp size.
>
> Hence, I attached the patch in tar.gz format, it's fairly big due to
> image and graphics, but couldn't manage to make it smaller.
>
> I removed bootstrap css and javascript from shipping, now they are
> served unmodified from their respective cdns, so from now on, the
> problem with long lines should be resolved.
>
> Hope you like it!
>
> Sincerely, Angelo
>
> --
> Profile: http://it.linkedin.com/in/compagnucciangelo
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20151014/08dad7da/attachment.html>
