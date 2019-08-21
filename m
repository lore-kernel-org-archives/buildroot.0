From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 21 Aug 2019 10:01:10 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2019-08-18
In-Reply-To: <20190821075136.GA12477@scaer> (Yann E. MORIN's message of "Wed, 
 21 Aug 2019 09:51:36 +0200")
References: <20190819054333.566812D8079@tinkie.tkos.co.il>
 <20190819124959.quvccga35p2ggkrf@sapphire.tkos.co.il>
 <20190819145514.19722372@windsurf.home>
 <4a15c906-869d-d069-1e3a-b6cefff69f1f@mind.be>
 <20190819233256.01c0f4a1@windsurf.home>
 <87zhk4erxo.fsf@dell.be.48ers.dk>
 <77298569-2f0f-d650-d396-3ea4be5b09eb@mind.be>
 <b1f6a7dd-7451-ef46-de7c-51efb9a9c38b@mind.be>
 <20190821075136.GA12477@scaer>
Message-ID: <87v9ur54mx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> Or perhaps it's a better idea to reverse the logic: on -rc1, create the stable
 >> branch already, and treat master as next. IOW, avoid creating a next at all.

 > I would argue in favour of this solution.

We could do that as well. We then need to merge in the other direction
(stable->master) to ensure fixes after rc1 (and updates to the CHANGES
file) are not dropped, and website changes needs to happen on master
rather than stable.

It seems a bit more complicated to me, but that might just be because I
have done the other way around for 10+ years by now ;)


 >> But then we should probably also update the branches info for the autobuilders
 >> to make sure the stable branch gets sufficient testing.

 > This is relatively easy: just update http://autobuild.buildroot.org/branches
 > with new branches and new ratios.

Yes, but this file in manually maintained and only accessible by Thomas,
right?

-- 
Bye, Peter Korsgaard
