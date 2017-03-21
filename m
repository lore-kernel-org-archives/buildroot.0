From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 23:18:21 +0100
Subject: [Buildroot] [PATCH 00/16] Enable hash checking for git downloads
In-Reply-To: <20170321000712.26500-1-arnout@mind.be>
References: <20170321000712.26500-1-arnout@mind.be>
Message-ID: <20170321231821.75afecd6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 21 Mar 2017 01:06:56 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:

> Patch 1 fixes the case when tar is compiled to generated Posix format
> tarballs.

So I've applied this one.

> Patch 2 is just a cleanup. This patch is optional.
> 
> Patch 3-5 fix incorrect hash files, which weren't noticed before
> because hashes weren't checked.
> 
> Patch 6-8 adds a hash for packages that actually have a hash file but
> set the hash type to 'none'. These patches are optional.

And all those ones.

> Patches 9-15 add exclusions for the different packages with CUSTOM_GIT
> configuration.

Still needs to review those one carefully.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
