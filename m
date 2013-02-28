From: James Hogan <james.hogan@imgtec.com>
Date: Thu, 28 Feb 2013 12:24:50 +0000
Subject: [Buildroot] [PATCH] gdb: convert to the package infrastructure
In-Reply-To: <20130228132048.727cf7fa@skate>
References: <1361916812-29395-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <512F0EAD.4080406@mind.be> <512F17B6.70501@imgtec.com>
 <20130228094741.50f605fc@skate> <512F4977.6000402@imgtec.com>
 <20130228132048.727cf7fa@skate>
Message-ID: <512F4C92.90407@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 28/02/13 12:20, Thomas Petazzoni wrote:
> On Thu, 28 Feb 2013 12:11:35 +0000, James Hogan wrote:
> 
>>> Not sure to follow here: Arnout mentions the choice list of gdb
>>> versions, which only have a limited number of choices already. If you
>>> need Buildroot to use some custom gdb version, then you already have to
>>> modify Buildroot anyway. Or maybe I'm missing the point you're making?
>>
>> Yes, but the modification is as simple as adding a patch file in the
>> right place.
> 
> It's still the case here: just add your patch in
> package/gdb/<version>/, and that's it.

I may have misunderstood what Arnout meant then. I thought he was
referring to removing the choice of GDB version ("Can't we just remove
the user-selectable version completely?").

Anyway, no big deal.

Cheers
James
