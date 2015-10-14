From: Steve Calfee <stevecalfee@gmail.com>
Date: Wed, 14 Oct 2015 08:38:09 -0700
Subject: [Buildroot] docs/website: New website
In-Reply-To: <CA+TH9VmNdKfHr5v8-OteT6TLC8DK-HGshyUnbHgX_p+A2rW2=A@mail.gmail.com>
References: <CA+TH9VmNdKfHr5v8-OteT6TLC8DK-HGshyUnbHgX_p+A2rW2=A@mail.gmail.com>
Message-ID: <CAJJ6jxvwh2Q7nozfQc5nhptf5tkwsR3bo26SbFwjOHj7_4mj-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Great, works on my Android phone too.

Regards, Steve

On Tue, Oct 13, 2015 at 12:54 PM, Angelo Compagnucci
<angelo.compagnucci@gmail.com> wrote:
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
