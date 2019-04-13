From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Apr 2019 10:00:17 +0200
Subject: [Buildroot] [PATCH 00/10] infra: add solution to dump metadata
 from packages (branch yem/misc)
In-Reply-To: <20190411212002.GG2539@scaer>
References: <cover.1554637858.git.yann.morin.1998@free.fr>
 <20190411192651.5196cd1c@windsurf.home> <20190411212002.GG2539@scaer>
Message-ID: <27920e20-8b65-1a38-d82a-edad8b289bce@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/04/2019 23:20, Yann E. MORIN wrote:
>> I'm not at all saying that we shouldn't merge this JSON output, I just
>> wanted to point out the different ways that already exist to extract
>> some package metadata out of Buildroot.
> Well, my idea wuld maybe to actually phase-out those rules, or at least
> base them on this new JSON output.
> 
> Heck, even graph-depends could use that instead of the recently
> introduced show-dependency-tree, and this is what I was going to do
> before the release, so that show-dependency-tree never ever gets into
> a release.

 Indeed, I think show-info can replace a lot of our special targets:
show-version, show-*depends, external-deps.

 Regards,
 Arnout
