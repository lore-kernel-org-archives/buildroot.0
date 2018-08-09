From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 23:38:58 +0200
Subject: [Buildroot] [PATCH 2/2] Revert "package/mono: remove target
 mips architecture"
In-Reply-To: <87zhxvdyro.fsf@dell.be.48ers.dk>
References: <1533817887-8771-1-git-send-email-angelo@amarulasolutions.com>
 <1533817887-8771-2-git-send-email-angelo@amarulasolutions.com>
 <20180809221533.42090817@windsurf>
 <87zhxvdyro.fsf@dell.be.48ers.dk>
Message-ID: <20180809233858.2c1dc72d@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 09 Aug 2018 23:18:51 +0200, Peter Korsgaard wrote:

>  > I'm not sure if Peter prefers:  
> 
>  >  - that we wait until 2018.08 is released to merge back next into
>  >    master before applying this patch  
> 
>  >  - that we cherry-pick just
>  >    0f96073561badde3c7abdf338abca7d00dba56dd from master to next and
>  >    then apply your patch to next  
> 
>  >  - that we merge master into next right now and apply your patch  
> 
>  > Peter ?  
> 
>  > I don't like option (1) because it leaves a patch waiting in patchwork.  
> 
> I guess option 2 should be fine and not really cause any issues when
> merging next into master, right?

I guess during the merge, Git will notice that the commit has already
been cherry-picked, and will simply skip it.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
