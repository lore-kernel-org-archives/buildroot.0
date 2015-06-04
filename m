From: Lionel Orry <lionel.orry@gmail.com>
Date: Thu, 4 Jun 2015 10:44:01 +0200
Subject: [Buildroot] Complete Buildroot training,
	with freely available materials
In-Reply-To: <1433297794-12521-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433297794-12521-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAKAx1cgVP3QVdRiP6=VP_Hr8mKxsS20TkQ-anLTM=Vq63oZxQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On Wed, Jun 3, 2015 at 4:16 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> I'm happy to announce that Free Electrons has developed a complete
> 3-days training course on Buildroot:
>
>   http://free-electrons.com/training/buildroot/

Awesome work! Thanks a lot to everyone who contributed to this guide.
I've read it entirely and I learned a lot of useful stuff and tips.

>
> It covers a large set of topics about using Buildroot, tuning the
> configuration, creating new packages, analyzing the build, using
> advanced Buildroot features, doing application development with
> Buildroot, and more.
>
> In addition to being a training course available for customers, Free
> Electrons also makes freely available all the training materials for
> this training course (like for all of the training courses developed
> by Free Electrons).

Thank you Free Electrons for this philosophy :)

>
> These training materials will I guess be complementing nicely the
> existing Buildroot reference manual.
>
> They are available at:
>
>  * Slides
>    http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf
>
>  * Practical labs
>    http://free-electrons.com/doc/training/buildroot/buildroot-labs.pdf
>
>  * Practical labs data
>    http://free-electrons.com/doc/training/buildroot/buildroot-labs.tar.xz
>
>  * LaTeX source code
>    http://git.free-electrons.com/training-materials/
>

In case we wish to suggest some corrections / additions, where should
we send patches for review ?

> I'd like to thank the members of the Buildroot community who reviewed
> those materials before their release and provided useful suggestions
> and fixes: Peter Korsgaard, Yann E. Morin, Thomas De Schampheleire,
> Gustavo Zacarias and Arnout Vandecappelle. Thanks a lot to them!
>
> Hopefully, having such a professional training course, together with
> freely available training materials, will help Buildroot become even
> more popular than it is today.
>
> I'm also proposing a patch in the follow-up e-mail, which adds a
> reference to the training materials from the Buildroot website.
>
> Best regards,
>
> Thomas
>
> Thomas Petazzoni (1):
>   docs/website: link to the Free Electrons training materials
>
>  docs/website/docs.html | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Kind regards,
Lionel
