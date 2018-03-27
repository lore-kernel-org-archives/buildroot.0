From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Mar 2018 09:47:54 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-03-26
In-Reply-To: <87in9it123.fsf@dell.be.48ers.dk>
References: <20180327060026.543B0206F3@mail.bootlin.com>
 <20180327064509.n3kp4rdolibyqwud@sapphire.tkos.co.il>
 <20180327091525.7e785751@windsurf.home>
 <87in9it123.fsf@dell.be.48ers.dk>
Message-ID: <20180327094754.35db48d1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 27 Mar 2018 09:44:36 +0200, Peter Korsgaard wrote:

>  > Arnout, Peter, any preference ? I'm leaning towards (2) since that's
>  > the solution that doesn't pollute Buildroot with unnecessary stuff.  
> 
> I agree. It does mean that we need all autobuilders to update, but that
> shouldn't be a big problem.

It also means that if someone uses autobuild-run to test another branch
than 2018.02.x, master or next, we have no idea whether we should use
"dependencies" or "core-dependencies".

But well, I believe autobuild-run is kind of an internal tool, it's not
really meant to be used as a generic tool. If people do this, then it's
up to them to figure out how to tweak it.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
