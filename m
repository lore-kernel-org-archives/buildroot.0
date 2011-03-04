From: Will Newton <will.newton@gmail.com>
Date: Fri, 4 Mar 2011 16:13:00 +0000
Subject: [Buildroot] [PATCH 0/8] Update GNU config support.
In-Reply-To: <87zkpjq20w.fsf@macbook.be.48ers.dk>
References: <AANLkTikOo9+wsqSNNLRPLJncArhW22BhXa6eV5Vu=QhU@mail.gmail.com>
	<87zkpjq20w.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTi=AvAnwz+z0JEQB10_UzejTWYa4+E7W9c9dzWMF@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Feb 25, 2011 at 8:42 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:
>
> ?Will> We currently use a version of config.sub that is nearly 4 years old
> ?Will> and a version of config.guess that is nearly 2 years old.
>
> ?Will> Since this package was last updated GNU config has merged a
> ?Will> couple of patches and moved to git. This means we cannot use cvs
> ?Will> up to update it any more, so we can get rid of all the files that
> ?Will> were kept around for that purpose.
>
> ?Will> ?23 files changed, 455 insertions(+), 2779 deletions(-)
>
> Always nice to see such a diffstat ;)
>
> Sounds good, will take a closer look at it post-2011.02.

Hi Peter,

Did you get time to take another look at this?

Thanks,
