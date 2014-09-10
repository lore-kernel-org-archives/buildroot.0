From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Sep 2014 10:54:39 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-09-09
In-Reply-To: <87mwa7eud3.fsf@dell.be.48ers.dk>
References: <20140910063013.732CF1018B1@stock.ovh.net>
 <87vbovewb3.fsf@dell.be.48ers.dk>
 <20140910101824.1aae716f@free-electrons.com>
 <87mwa7eud3.fsf@dell.be.48ers.dk>
Message-ID: <20140910105439.2b2bc0bd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 10 Sep 2014 10:46:00 +0200, Peter Korsgaard wrote:

>  > Great! So the only one left is gcc110, right?
> 
> Yes. I also played with gcc14, but that one is so old that I need to
> apply Thomas' rhel5 patches first.

Ok. Let's take care of gcc110 first then.

>  > Also, how many instances are you running on each machine?
> 
> currently I'm using:
> 
> ninstances = 3
> njobs = 4
> 
> On all 3 machines, but I might tweak that a bit.

Ok, looks good.

>  > Thanks for getting this done, it's nice to see we jumped from ~100
>  > builds a few weeks ago to ~300 builds now. I expect the number of
>  > builds per day to reduce a little bit as we fix issues (successful
>  > builds are statistically longer than failed builds!), but still we
>  > should be in the 250-300 builds/day range.
> 
> Yeah, sorry it took so long.

No problem. It was good to see Richard and Nathaniel join the
autobuilder effort, as they were able to test the script in other
conditions than the ones I tested.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
