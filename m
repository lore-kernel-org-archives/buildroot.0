From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 07 Jan 2009 13:55:33 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <87hc4bl4ah.fsf@macbook.be.48ers.dk>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<200901070409.42558.markus.heidelberg@web.de>
	<1231326832.32308.320.camel@elrond.atmel.com>
	<200901071250.05379.markus.heidelberg@web.de>
	<87hc4bl4ah.fsf@macbook.be.48ers.dk>
Message-ID: <1231332933.32308.376.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2009-01-07 klockan 12:54 +0100 skrev Peter Korsgaard:
> >>>>> "Markus" == Markus Heidelberg <markus.heidelberg@web.de> writes:
> 
> Hi,
> 
>  Markus> See my comment above. Why picking commits from HCE, making his
>  Markus> repository more valueless, because everything is also in
>  Markus> uclibc-buildroot and at the same time risk breaking it or prevent
>  Markus> updating packages (mplayer for example)?
> 

I think I have shown that you can have the cookie and eat it as well.
With my proposal there will be

?* Very little need to declare an architecture broken
  by allowing limitations on each architectures.

* A single source version for a distribution

* Patches that are tested and verified for all 
  architectures, for which the package is available.

* possibilities to commit for development purposes,
?  without disrupting the stable or testing 
  distribution. This activity can be ongoing,
  and there is no need to stop the fixing
  of a package, due to release dates.
  Allowing patches for development purposes
  allows buildroot to become a team effort.

* Allow stable distribution to coexist with
  test distributions.

* Allow existence of multiple distributions

* Allow users to work with custom patches
  easily without commiting until proved correct.


Best Regards
Ulf Samuelsson
> I would like to know that as well.
> 
