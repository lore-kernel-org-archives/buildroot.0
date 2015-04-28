From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Apr 2015 21:17:23 +0200
Subject: [Buildroot] [PATCH v7 0/8] toolchain: better handle hashes
 (branch yem/dl-hash-toolchains)
In-Reply-To: <20150425142634.516e800e@free-electrons.com>
References: <1429740521-31943-1-git-send-email-arnout@mind.be>
 <20150425142634.516e800e@free-electrons.com>
Message-ID: <553FDCC3.2090607@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/25/15 14:26, Thomas Petazzoni wrote:
> One thing that bothered me a little bit is that when the hash of the
> tarball downloaded from upstream doesn't match the one we have in BR,
> we gracefully fall back on downloading the tarball from
> sources.buildroot.net.
> 
> This is good for users as it means their build succeeds. But not so
> good from the point of view of noticing that upstream has for some
> reason changed the tarball.

 We could disable the SECONDARY site in the autobuilders.

 Regards,
 Arnout

> 
> Any opinion about this?


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
