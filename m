From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 9 Nov 2017 17:55:28 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-11-08
In-Reply-To: <20171109124249.4f57a264@windsurf>
References: <20171109070011.4320C209F1@mail.free-electrons.com>
 <20171109072720.ysow3pwt4igf5vva@tarshish>
 <20171109124249.4f57a264@windsurf>
Message-ID: <20171109155528.4pzxpewdk5te2ztw@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Nov 09, 2017 at 12:42:49PM +0100, Thomas Petazzoni wrote:
> On Thu, 9 Nov 2017 09:27:20 +0200, Baruch Siach wrote:
> 
> > > Build statistics for 2017-11-08
> > > ===============================
> > > 
> > >       branch |  OK | NOK | TIM | TOT |
> > >       master | 142 |  31 |   0 | 173 |
> > >    2017.08.x |   6 |   0 |   0 |   6 |  
> > 
> > Nice. Thanks for working on that.
> 
> You're welcome :)
> 
> However, in fact, it was not really planned to be deployed today, I
> forgot yesterday evening to revert the script to its original state.
> The support is not complete yet, and due to my changes, the individual
> e-mails normally sent to each developer have not been sent today.
> 
> > > Results for branch 'master'
> > > ===========================
> 
> The name of the branch is here ^^^

I missed that.

> > > Detail of failures
> > > ------------------  
> > 
> > Having an additional 'branch' column here might be useful now.
> 
> The list of failures below is only for the master branch, as you're in
> the "Results for branch 'master'".
> 
> Failures for other branches would show up in another section "Results
> for branch '2017.08.x'". However, since there has been 0 failures on
> 2017.08.x yesterday, the section was not generated at all (which is
> expected).
> 
> Let me know if that is unclear and if you have a better proposal.
> Mixing the results in the same table was to me not a good option, as we
> clearly don't want the "List of failures by reason" to contain results
> for multiple branches, as this classification only makes sense per
> branch. That's why I opted for one section per branch, rather than
> mixing the results together. I'm open to other suggestions, as the
> drawback of my solution is the length of the e-mail.

That is reasonable, I think. It only adds a few more lines per email.

And besides, this is all only for the time being, until we fix all remaining 
build failures.

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
