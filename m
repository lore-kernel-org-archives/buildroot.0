From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 23:15:39 +0200
Subject: [Buildroot] [PATCH v5 1/1] package/rpm: switch to version
 4.12.0.1
In-Reply-To: <44f2d9ff-605a-f414-21df-e9d3eace0164@mind.be>
References: <20160909163708.31980-1-james.knight@rockwellcollins.com>
 <20160911155431.6204c127@free-electrons.com>
 <44f2d9ff-605a-f414-21df-e9d3eace0164@mind.be>
Message-ID: <20160911231539.29e123e3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 11 Sep 2016 23:10:29 +0200, Arnout Vandecappelle wrote:

>  v4 of the patch (about a year old) still had
> 
> The provided "bump" (suggested by Baruch Siach) switches from the rpm5
> implementation to rpm.org's more active stream.
> 
>  It would be good to keep this information, and even add a link to [0]
> 
> [0] http://lists.buildroot.org/pipermail/buildroot/2015-August/137580.html
> 
>  I just checked on openhub, and indeed, rpm.org seems to get about 10 times more
> commits than rpm5.org.

Thanks for the additional info.

> > RPM seems like a weird project, it's widely used, but it's very hard to
> > understand what is the real upstream for it. This fact was even  
> 
>  It looks pretty obvious to me: rpm5.org is a fork of rpm.org.
> 
> > discussed on LWN recently: https://lwn.net/Articles/196523/.  
> 
>  Er, Thomas, you're by far not old enough to be allowed to call a 10 year old
> article "recent" :-)

Gah. The one I read recently is
https://blog.fuzzing-project.org/52-Multiple-vulnerabilities-in-RPM-and-a-rant.html,
which was referenced by LWN in https://lwn.net/Articles/698453/.
Indeed, the other one is 10 year old. Interestingly
https://lwn.net/Articles/698453/ also points to the 10 year old
article saying that not much has improved in the RPM maintenance over a
10 year period.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
