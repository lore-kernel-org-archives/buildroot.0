From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 19 Aug 2019 23:28:09 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-08-18
In-Reply-To: <20190819145514.19722372@windsurf.home>
References: <20190819054333.566812D8079@tinkie.tkos.co.il>
 <20190819124959.quvccga35p2ggkrf@sapphire.tkos.co.il>
 <20190819145514.19722372@windsurf.home>
Message-ID: <4a15c906-869d-d069-1e3a-b6cefff69f1f@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/08/2019 14:55, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 19 Aug 2019 15:49:59 +0300
> Baruch Siach <baruch@tkos.co.il> wrote:
> 
>> The list of packages versions in Buildroot seems to be take from the master 
>> branch. All these packages were updated in the next branch. I think that when 
>> the next branch is active (i.e. has commits not in master), the script should 
>> look there instead of master.
> 
> Yes, this is a limitation of how we work right now. I'm not sure how to
> handle this exactly at this point.
> 
> Should the results of http://autobuild.buildroot.net/stats/ and
> http://autobuild.buildroot.net/stats/index.json use the next branch
> when available ?
> 
> Having a look at the state of the master branch in terms of missing
> version updates could also be helpful to detect packages for which
> we're missing security updates.

 Not really, since we only show the highest release, so not anything from stable
branches. And we can assume that the version on next is >= the version on master.


 Regards,
 Arnout

> 
> So really, I'm not sure what is the best course of action here.
> 
> Thomas
> 
