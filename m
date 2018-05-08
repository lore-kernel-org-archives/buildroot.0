From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 May 2018 14:25:54 +0200
Subject: [Buildroot] Analysis of build results for 2018-05-06
In-Reply-To: <20180508095718.geg4ousamb3ae2xi@tarshish>
References: <20180507060023.E26CE207B7@mail.bootlin.com>
 <20180507234635.4d21612b@windsurf>
 <20180508043238.c3fv3552a7yo26he@tarshish>
 <20180508111447.73787b34@windsurf>
 <20180508095718.geg4ousamb3ae2xi@tarshish>
Message-ID: <20180508142554.36d4dfa8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 8 May 2018 12:57:18 +0300, Baruch Siach wrote:

> > Argh indeed, my bad. I applied it locally, didn't push it, and then
> > due to a git reset --hard, it got lost. I've now re-applied that
> > commit, and pushed this time.  
> 
> Since you have the commit ID you could restore the original commit with
> 
>   git checkout -b lxc-fix 52dcec570e05

That's what I did, with:

	git cherry-pick 52dcec570e05

Thanks :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
