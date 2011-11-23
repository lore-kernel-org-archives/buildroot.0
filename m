From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Nov 2011 09:47:52 +0100
Subject: [Buildroot] 2011.11: manual improvements
In-Reply-To: <CAAXf6LWh3_+8zwBjaJkpFH05+J=oSSPZbztZuNsoAVOKmGRuXw@mail.gmail.com>
References: <CAAXf6LUPKRJUJF83-x1n4rRVXdmg3Ob-1dgtyuV+6v+aqfKbWQ@mail.gmail.com>
 <CAAXf6LV2Z+FEk79qj3nqg1faH1wpWXzAVBin1Uh9xUvpvf0pTg@mail.gmail.com>
 <20111123092314.5065a4b8@skate>
 <CAAXf6LWh3_+8zwBjaJkpFH05+J=oSSPZbztZuNsoAVOKmGRuXw@mail.gmail.com>
Message-ID: <20111123094752.076f5383@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 23 Nov 2011 09:37:49 +0100,
Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :

> Alternatively, we could add a symbolic link from docs/manual to
> output/docs/manual, and put the link under version control.

No. The output is not necessarily in output/. With the O= option, you
can put it wherever you want (that's the point of out-of-tree build).

> But, this has the downside of having manuals in two places: the
> official manual distributed with a release tarball and the generated
> manual in output/docs.

I simply think it's a matter of :

 * Having generated versions of the manual in the release tarball

 * Having generated versions of the manual on the Buildroot website.
   Actually, I think people will more naturally search on the project
   website for documentation rather than inside the tarball. These
   days, everybody 'googles something' before running 'man something' :)

 * Documenting how to generate the manual.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
