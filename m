From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Dec 2019 16:53:31 +0100
Subject: [Buildroot] [PATCH] package/pkg-python: use _CONFIGURE_OPTS for
 build env
In-Reply-To: <87sglwl1wi.fsf@dell.be.48ers.dk>
References: <20191205231103.27778-1-ryan.barnett@rockwellcollins.com>
 <20191206233513.5f6260d7@windsurf.home>
 <87sglwl1wi.fsf@dell.be.48ers.dk>
Message-ID: <20191209165331.39589bbe@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 07 Dec 2019 14:07:41 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

>  >> package/pkg-python.mk | 11 ++++++-----
>  >> 1 file changed, 6 insertions(+), 5 deletions(-)  
> 
>  > Applied to master, thanks.  
> 
> Hmm, this seems to confuse lirc-tools:
> 
> http://autobuild.buildroot.net/results/f7a/f7a9c02add9bde563c7289f7c0be2cb7aefd96b8/build-end.log

I think this sort of change was pretty likely to cause some build
breakage, so it's good to merge it early.

Ryan, will you take a look at this issue ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
