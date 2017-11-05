From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Nov 2017 09:55:44 +0100
Subject: [Buildroot] [PATCH 1/1] docs: update DEVELOPERS modification
 process
In-Reply-To: <87y3nl2mt2.fsf@dell.be.48ers.dk>
References: <20171103211053.20886-1-joseph.kogut@gmail.com>
 <20171104185305.5vkjjg6iwrhctcis@tarshish>
 <20171104231427.3b3f436a@windsurf>
 <87y3nl2mt2.fsf@dell.be.48ers.dk>
Message-ID: <20171105095544.2b045a56@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 05 Nov 2017 08:43:05 +0100, Peter Korsgaard wrote:

>  > However, I agree that doing the DEVELOPERS change in a patch just
>  > modifying the package is perhaps not desirable. When adding a new
>  > package, yes, definitely, the DEVELOPERS entry should be added as part
>  > of the same patch. However, when a package is being modified, that's a
>  > different story, and the package change should be in a separate patch
>  > than the DEVELOPERS addition.  
> 
> I'm not sure it really matters much. A package change with a
> modification of DEVELOPERS would most likely be for a version bump of an
> unmaintained package where the person bumping wants to take over
> ownership, or similar.
> 
> I don't think it is a problem to update DEVELOPERS together with the
> package in such cases, but keeping it separately is also fine.

Agreed.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
