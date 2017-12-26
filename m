From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 26 Dec 2017 18:11:43 +0100
Subject: [Buildroot] [PATCH] package/libpqxx: fix broken sed call
In-Reply-To: <87k1x9wikr.fsf@dell.be.48ers.dk>
References: <20171226131425.7199-1-romain.naour@gmail.com>
 <87k1x9wikr.fsf@dell.be.48ers.dk>
Message-ID: <8adcfc70-d485-3bb0-1e2a-99215f841571@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 26/12/2017 ? 17:38, Peter Korsgaard a ?crit?:
>>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:
> 
>  > Backport 2 upstream fix.
> 
> 2? I only see 1 patch. Did you forget to git add a file?
> 
There are squashed together inside the same patch file:

"Upstream fix from commit [1][2]

[1] 80a9d5386641ac67d4ea1b602c786b45b40b252f
[2] 85e9336740475be25ed19924cca0961f7d844c4b"

I haven't used git cherry-pick here since the upstream patch contains other
stuff :-/

Best regards,
Romain
