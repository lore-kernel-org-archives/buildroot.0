From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 23 Nov 2011 09:56:45 +0100
Subject: [Buildroot] 2011.11: manual improvements
In-Reply-To: <20111123094752.076f5383@skate>
References: <CAAXf6LUPKRJUJF83-x1n4rRVXdmg3Ob-1dgtyuV+6v+aqfKbWQ@mail.gmail.com>
 <CAAXf6LV2Z+FEk79qj3nqg1faH1wpWXzAVBin1Uh9xUvpvf0pTg@mail.gmail.com>
 <20111123092314.5065a4b8@skate>
 <CAAXf6LWh3_+8zwBjaJkpFH05+J=oSSPZbztZuNsoAVOKmGRuXw@mail.gmail.com>
 <20111123094752.076f5383@skate>
Message-ID: <CAAXf6LVEJhjC1D+LW6t1srgMXMiFD7LLXxB2LAE4Xk=21mZ0-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 23, 2011 at 9:47 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Le Wed, 23 Nov 2011 09:37:49 +0100,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> Alternatively, we could add a symbolic link from docs/manual to
>> output/docs/manual, and put the link under version control.
>
> No. The output is not necessarily in output/. With the O= option, you
> can put it wherever you want (that's the point of out-of-tree build).
>
>> But, this has the downside of having manuals in two places: the
>> official manual distributed with a release tarball and the generated
>> manual in output/docs.
>
> I simply think it's a matter of :
>
> ?* Having generated versions of the manual in the release tarball
>
> ?* Having generated versions of the manual on the Buildroot website.
> ? Actually, I think people will more naturally search on the project
> ? website for documentation rather than inside the tarball. These
> ? days, everybody 'googles something' before running 'man something' :)
>
> ?* Documenting how to generate the manual.

Ok agreed.
If there is a manual distributed with the release tarball, your
average user will not need to generate one himself anyway.
Only people working directly from the git repo, and developers
changing the manual, need to know where to find the generated one.

~Thomas
