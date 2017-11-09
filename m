From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Nov 2017 12:42:49 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2017-11-08
In-Reply-To: <20171109072720.ysow3pwt4igf5vva@tarshish>
References: <20171109070011.4320C209F1@mail.free-electrons.com>
 <20171109072720.ysow3pwt4igf5vva@tarshish>
Message-ID: <20171109124249.4f57a264@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 9 Nov 2017 09:27:20 +0200, Baruch Siach wrote:

> > Build statistics for 2017-11-08
> > ===============================
> > 
> >       branch |  OK | NOK | TIM | TOT |
> >       master | 142 |  31 |   0 | 173 |
> >    2017.08.x |   6 |   0 |   0 |   6 |  
> 
> Nice. Thanks for working on that.

You're welcome :)

However, in fact, it was not really planned to be deployed today, I
forgot yesterday evening to revert the script to its original state.
The support is not complete yet, and due to my changes, the individual
e-mails normally sent to each developer have not been sent today.

> > Results for branch 'master'
> > ===========================

The name of the branch is here ^^^

> > Detail of failures
> > ------------------  
> 
> Having an additional 'branch' column here might be useful now.

The list of failures below is only for the master branch, as you're in
the "Results for branch 'master'".

Failures for other branches would show up in another section "Results
for branch '2017.08.x'". However, since there has been 0 failures on
2017.08.x yesterday, the section was not generated at all (which is
expected).

Let me know if that is unclear and if you have a better proposal.
Mixing the results in the same table was to me not a good option, as we
clearly don't want the "List of failures by reason" to contain results
for multiple branches, as this classification only makes sense per
branch. That's why I opted for one section per branch, rather than
mixing the results together. I'm open to other suggestions, as the
drawback of my solution is the length of the e-mail.

> Unrelated to that (I think), DNS resolution for autobuild.buildroot.net looks 
> strange this morning:
> 
> $ host autobuild.buildroot.net
> autobuild.buildroot.net is an alias for ks383786.kimsufi.com.
> ks383786.kimsufi.com has address 94.23.254.152

Peter explained that it is normal. The server is now back up :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
