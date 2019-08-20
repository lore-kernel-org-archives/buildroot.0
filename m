From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 20 Aug 2019 21:18:14 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-08-18
In-Reply-To: <77298569-2f0f-d650-d396-3ea4be5b09eb@mind.be>
References: <20190819054333.566812D8079@tinkie.tkos.co.il>
 <20190819124959.quvccga35p2ggkrf@sapphire.tkos.co.il>
 <20190819145514.19722372@windsurf.home>
 <4a15c906-869d-d069-1e3a-b6cefff69f1f@mind.be>
 <20190819233256.01c0f4a1@windsurf.home> <87zhk4erxo.fsf@dell.be.48ers.dk>
 <77298569-2f0f-d650-d396-3ea4be5b09eb@mind.be>
Message-ID: <b1f6a7dd-7451-ef46-de7c-51efb9a9c38b@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 20/08/2019 21:10, Arnout Vandecappelle wrote:
> 
> 
> On 20/08/2019 00:00, Peter Korsgaard wrote:
>>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:
>>
>> Hi,
>>
>>  > "we only show the highest release" -> release-monitoring.org doesn't
>>  > have the notion of "stable branches" from upstream or anything like
>>  > that. It even considers -rc versions to be more recent than a regular
>>  > official release.
>>
>>  > But I see your point that anyway release-monitoring.org is only very
>>  > partially helping to track whether we need to update for security
>>  > reasons. A CVE-related tracking tool (such as what Matt Weber was
>>  > working on back then) would be better suited for this task.
>>
>>  > If you agree with this, then perhaps the autobuild.b.o/stats/ page, and
>>  > the corresponding JSON output, should be generated based on the next
>>  > branch rather than the master branch.
>>
>> Presumably only if next exists (and then we have to remember to delete
>> it as soon as we merge it into master and not just let it linger until
>> the next release)?
> 
>  That would be a good idea anyway. I've known people to be confused by the
> lingering next branch.

 Or perhaps it's a better idea to reverse the logic: on -rc1, create the stable
branch already, and treat master as next. IOW, avoid creating a next at all.

 But then we should probably also update the branches info for the autobuilders
to make sure the stable branch gets sufficient testing.

 Regards,
 Arnout

> 
> 
>>  > Should I go ahead and make the change ?
>>
>> It sounds sensible to me, yes.
> 
>  +1
> 
>  Regards,
>  Arnout
> 
