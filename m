From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 23 Nov 2016 23:15:05 +0100
Subject: [Buildroot] [PATCH v4 00/22] Splitting the toolchain-external
 package
In-Reply-To: <20161123223924.024343a3@free-electrons.com>
References: <20161107012017.22505-1-arnout@mind.be>
 <20161123223924.024343a3@free-electrons.com>
Message-ID: <2752f56e-8889-c135-9116-830a2ce4cf91@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Le 23/11/2016 ? 22:39, Thomas Petazzoni a ?crit :
> Hello,
> 
> On Mon, 7 Nov 2016 02:19:55 +0100, Arnout Vandecappelle
> (Essensium/Mind) wrote:
> 
>> The following changes since commit 6bb7430a20871ad4e3ccbc8c1992d60117214be2:
>>
>>   Makefile: delete default rules (2016-11-05 23:34:26 +0100)
>>
>> are available in the git repository at:
>>
>>   http://github.com/arnout/buildroot external-toolchain
>>
>> for you to fetch changes up to ad925c956093b8fcd04d084471b78f9ca074cbb9:
>>
>>   toolchain-external: remove Arago toolchains (2016-11-07 02:15:06 +0100)
> 
> I've applied the entire patch series. I've looked at the result after
> applying all of them, and it looks good to me overall. Considering the
> amount of things being moved/changed, I'm sure we'll find some issues
> here and there, but the only way is really to apply those patches and
> see what breaks.
> 
> If there are people using external toolchains, then it would be nice if
> they could give a test to the next branch right now, and report any
> issue with toolchain handling.
> 
> Thanks Arnout and Romain for having picked up and finished my initial
> work!

Thanks Arnout for the final respin :)

Romain

> 
> Thomas
> 
