From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 10 Oct 2014 19:30:58 -0500
Subject: [Buildroot] [PATCH v3] package/mono: new package
In-Reply-To: <CA+TH9V=qR-vBU+RHrzFj9KYqouzKnTgLZ4y+hUYOWkab6XS8hg@mail.gmail.com>
References: <1412951017-6769-1-git-send-email-angelo.compagnucci@gmail.com>
 <20141010204840.4ec4d5d3@free-electrons.com>
 <CA+TH9VkBYm1viE8=o9Miy8Pb4mGrmUxCdDJZ1rTncSysfbcPiA@mail.gmail.com>
 <CA+TH9V=qR-vBU+RHrzFj9KYqouzKnTgLZ4y+hUYOWkab6XS8hg@mail.gmail.com>
Message-ID: <CANQCQpZ42nvXDzKht1xk5XzQmCQ=Kp9JyAps6SGghaxtHqLb-A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo,
On Oct 10, 2014 2:37 PM, "Angelo Compagnucci" <angelo.compagnucci@gmail.com>
wrote:
>
> Hi Thomas,
>
> >> I'm working on the patches that use a single mono package. There are
> >> other issues with your patch: host-mono-managed automatically downloads
> >> monolite, which is bad, as it circumvents the download infrastructure
> >> of Buildroot. I'll show you an approach to fix that.
>
> Another thing. I'm using this patch as a training to understand better
> how to write good buildroot packages. I hope to contribute more in the
> future! I really appreciate any hint and I prefer to write the patch
> myself!
> So I will be really grateful if you can review this patch and point me
> to the right direction, step by step, if it's not to much a hassle for
> you!
>

For your reference, I've got a start on taking a submission from a few
months back and making the build a single package.  I'll send out the patch
when I'm back in the office Monday.  I never had a chance to completely
finish and test it.

Thanks,
Matt

> Again, thank you for your time!
>
> >> Best regards,
> >>
> >> Thomas
> >> --
> >> Thomas Petazzoni, CTO, Free Electrons
> >> Embedded Linux, Kernel and Android engineering
> >> http://free-electrons.com
> >
> >
> >
> > --
> > Profile: http://it.linkedin.com/in/compagnucciangelo
>
>
>
> --
> Profile: http://it.linkedin.com/in/compagnucciangelo
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141010/cd960aef/attachment.html>
