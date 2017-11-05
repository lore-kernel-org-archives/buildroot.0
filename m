From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 05 Nov 2017 08:43:05 +0100
Subject: [Buildroot] [PATCH 1/1] docs: update DEVELOPERS modification
 process
In-Reply-To: <20171104231427.3b3f436a@windsurf> (Thomas Petazzoni's message of
 "Sat, 4 Nov 2017 23:14:27 +0100")
References: <20171103211053.20886-1-joseph.kogut@gmail.com>
 <20171104185305.5vkjjg6iwrhctcis@tarshish>
 <20171104231427.3b3f436a@windsurf>
Message-ID: <87y3nl2mt2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> Not sure about "or modifying". Mixing a DEVELOPERS update into a random 
 >> package update does not always make sense. The manual only refers to new 
 >> packages/boards. I suggest to drop this sentence entirely, and leave the 
 >> details for the manual.

 > Joseph is modifying the manual here, so I'm not sure what your last
 > sentence means.

 > However, I agree that doing the DEVELOPERS change in a patch just
 > modifying the package is perhaps not desirable. When adding a new
 > package, yes, definitely, the DEVELOPERS entry should be added as part
 > of the same patch. However, when a package is being modified, that's a
 > different story, and the package change should be in a separate patch
 > than the DEVELOPERS addition.

I'm not sure it really matters much. A package change with a
modification of DEVELOPERS would most likely be for a version bump of an
unmaintained package where the person bumping wants to take over
ownership, or similar.

I don't think it is a problem to update DEVELOPERS together with the
package in such cases, but keeping it separately is also fine.

-- 
Bye, Peter Korsgaard
