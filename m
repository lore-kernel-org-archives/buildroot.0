From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  3 Jun 2015 04:16:33 +0200
Subject: [Buildroot] Complete Buildroot training,
	with freely available materials
Message-ID: <1433297794-12521-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I'm happy to announce that Free Electrons has developed a complete
3-days training course on Buildroot:

  http://free-electrons.com/training/buildroot/

It covers a large set of topics about using Buildroot, tuning the
configuration, creating new packages, analyzing the build, using
advanced Buildroot features, doing application development with
Buildroot, and more.

In addition to being a training course available for customers, Free
Electrons also makes freely available all the training materials for
this training course (like for all of the training courses developed
by Free Electrons).

These training materials will I guess be complementing nicely the
existing Buildroot reference manual.

They are available at:

 * Slides
   http://free-electrons.com/doc/training/buildroot/buildroot-slides.pdf

 * Practical labs
   http://free-electrons.com/doc/training/buildroot/buildroot-labs.pdf

 * Practical labs data
   http://free-electrons.com/doc/training/buildroot/buildroot-labs.tar.xz

 * LaTeX source code
   http://git.free-electrons.com/training-materials/

I'd like to thank the members of the Buildroot community who reviewed
those materials before their release and provided useful suggestions
and fixes: Peter Korsgaard, Yann E. Morin, Thomas De Schampheleire,
Gustavo Zacarias and Arnout Vandecappelle. Thanks a lot to them!

Hopefully, having such a professional training course, together with
freely available training materials, will help Buildroot become even
more popular than it is today.

I'm also proposing a patch in the follow-up e-mail, which adds a
reference to the training materials from the Buildroot website.

Best regards,

Thomas

Thomas Petazzoni (1):
  docs/website: link to the Free Electrons training materials

 docs/website/docs.html | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
