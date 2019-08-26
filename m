From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 26 Aug 2019 09:38:59 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-08-18
In-Reply-To: <87r25e6dj1.fsf@dell.be.48ers.dk>
References: <20190819054333.566812D8079@tinkie.tkos.co.il>
 <20190819124959.quvccga35p2ggkrf@sapphire.tkos.co.il>
 <20190819145514.19722372@windsurf.home>
 <4a15c906-869d-d069-1e3a-b6cefff69f1f@mind.be>
 <20190819233256.01c0f4a1@windsurf.home>
 <87zhk4erxo.fsf@dell.be.48ers.dk>
 <77298569-2f0f-d650-d396-3ea4be5b09eb@mind.be>
 <b1f6a7dd-7451-ef46-de7c-51efb9a9c38b@mind.be>
 <20190821075136.GA12477@scaer> <87v9ur54mx.fsf@dell.be.48ers.dk>
 <20190821091336.GD12477@scaer> <87r25e6dj1.fsf@dell.be.48ers.dk>
Message-ID: <20190826093859.1ceee67d@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Aug 2019 12:03:46 +0200
Peter Korsgaard <peter@korsgaard.com> wrote:

>  >   - one to add the new stable branch and remove the oldest stable branch
>  >     (after -rc1)  
> 
> But that doesn't take the weights into consideration, so we would end up
> spending most of the autobuilder time on master (E.G. what we now call
> next).
> 
> Anyway, I am OK with giving it a try for 2019.11, but I'm not completely
> convinced about it.

I also don't really see the benefit(s) of this change. To me, it seems
a lot easier to just adjust the logic that generates the package
statistics to use the next branch when it is available. The rest of our
existing workflow can continue to work as-is. It's already confusing
for some of our contributors, if in addition to that we keep changing
our workflow for gratuitous reasons, it is not going to help.

So I'm not really in favor of changing the workflow, unless there is
some clear benefit to it.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
