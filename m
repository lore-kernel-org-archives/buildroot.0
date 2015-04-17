From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 17 Apr 2015 16:00:58 +0200
Subject: [Buildroot] [PATCHv2 11/21] pkg-download: extend DOWNLOAD_INNER,
 add a SOURCE_CHECK macro
In-Reply-To: <5530E28F.2010600@green-communications.fr>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-12-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150413210024.GK29025@free.fr> <552D732C.3060907@mind.be>
 <20150414222545.GD4053@free.fr> <552D97B1.5010705@mind.be>
 <5530E28F.2010600@green-communications.fr>
Message-ID: <5531121A.6000002@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/04/15 12:38, Nicolas Cavallari wrote:
> On 15/04/2015 00:41, Arnout Vandecappelle wrote:
>> On 15/04/15 00:25, Yann E. MORIN wrote:

[snip]

>>> So, does it make sense to keep source-check at all?
>>
>>
>>  I was thinking the same thing, I can't really see a use case for it. Actually,
>> same thing for external-deps.
> 
> external-deps is useful: We use it e.g. to clean a dl/ directory after
> bumping package versions, or to copy only relevant files in dl/ to an
> offline location.
> 
> Clearing the dl/ directory and running "make source" would end up with
> the same thing, but it would redownloads everything so it would be
> much slower.
> 

 Care to write up some documentation for this use case?

 source-check remains useless, right?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
