From: Sam Ravnborg <sam@ravnborg.org>
Date: Mon, 7 Nov 2011 13:09:36 +0100
Subject: [Buildroot] Report from the Buildroot Developer Day
In-Reply-To: <CAAXf6LV8pXKtNqU5oey_yikX_7YMLLVJpd9aE9SpyCgiuCC7zw@mail.gmail.com>
References: <20111102160349.4afe5935@skate>
 <CAAXf6LV8pXKtNqU5oey_yikX_7YMLLVJpd9aE9SpyCgiuCC7zw@mail.gmail.com>
Message-ID: <20111107120936.GA26160@merkur.ravnborg.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> >
> > We however came up with a set of proposals for the development process
> > organization:
> >
> > ?* We would like to encourage the community to help the maintainer job
> > ? by reviewing others patches (making comments, and providing their
> > ? Reviewed-by tags when they consider that the patch *looks* good)
> > ? and even better by testing other patches (testing the package
> > ? bumps, the new packages, etc. and providing their Tested-by
> > ? tags). If a given patch has been tested by 1 or 2 developers other
> > ? than the patch author, then Peter can trust that testing was done
> > ? and merge the patch quickly. This is really the key point on which
> > ? the community as a whole can help in making Buildroot move faster.
> 
> Could someone clarify the difference between Acked-by and Reviewed-by ?
> I looked up the Linux kernel definitions, but this didn't make it
> clearer for me.
The tags seems to be used in different ways. The way I have understood
their usage - and thus the way I have used them is like this:

Acked-by is used when I think that a patch does the right thing.
For example when it introduces a a new feature or change something -
and which I consider it the right thing to do.

Reviewed-by is stronger in the sense that I have actually taking my
time to carefully read the patch line-by-line and that I consider
that the patch is correct.
I almost never use "Reviewed-by" for patches touching code areas
that I am not familiar with - as I do not know if they are correct.
Reviewed-by includes an implicit Acked-by as I would not spend time
to review something if I did not agree on the patch.

Hope this helps...

	Sam
