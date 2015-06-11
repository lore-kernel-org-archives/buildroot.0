From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 12 Jun 2015 01:18:34 +0200
Subject: [Buildroot] [PATCH 0/11 v2] pkg-kernel-module: new infra to
 ease building kernel modules (branch yem/kernel-modules)
In-Reply-To: <20150611180338.GA3689@free.fr>
References: <cover.1433964001.git.yann.morin.1998@free.fr>
 <20150611180338.GA3689@free.fr>
Message-ID: <557A174A.6040806@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/11/15 20:03, Yann E. MORIN wrote:
> Hello All,
> 
> On 2015-06-10 21:22 +0200, Yann E. MORIN spake thusly:
>> This series introduces a new infrastructure to help writing packages
>> that build kernel modules.
> 
> I'll mark this series as "Changes Requested" in patchwork, because I took
> Jeremy's comment into account, and because I was able to improve it yet a
> bit more and convert one more kernel-module-providing package (namely,
> nvidia-driver; who would have thought it would be possible? ;-) ).

 Early feedback on that one:

NVIDIA_DRIVER_HEADERS_H -> NVIDIA_DRIVER_MODULE_BUILD_HEADERS

Commit message should explain why the custom install isn't needed anymore either.


 Regards,
 Arnout

> 
> So, I'll respin later, but I'm still interested in reviews on this
> iteration.
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
