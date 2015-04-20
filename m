From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 20 Apr 2015 22:31:08 +0200
Subject: [Buildroot] Towards 2015.05-rc1
In-Reply-To: <20150419220053.2c1d5b62@free-electrons.com>
References: <20150419220053.2c1d5b62@free-electrons.com>
Message-ID: <5535620C.6010801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/04/15 22:00, Thomas Petazzoni wrote:
> Hello,
> 
> We're about 10 days from cutting 2015.05-rc1, so we have only 10 days
> left to merge new features, new packages, major changes. Please let me
> know which (big) changes you'd like to see merged.
> 
> On my list, there is at least:
> 
>  - The mandatory hashes series from Yann/Arnout.

 This one is actually still missing handling user-specified downloads, like
custom U-Boot version or custom Linux version. That said, most of the series
(barring the last one) could be applied as far as I'm concerned. Although I
notice now that I forgot to add my acks to my repost :-)

> 
>  - The external-deps/source/source-check/legal-info fixes series from
>    me.

 IIRC there was still something major missing in this series as well, wasn't there?


 Another series that I'd like to see is the IPv6 deprecation, and size-stats.
But I guess I should do some review there :-)


 Regards,
 Arnout


> 
> Also, if you are worried about smaller things being merged, please make
> sure to review and test the corresponding patches. If your patches
> didn't get attention, try to convince someone else to review/test your
> patches.
> 
> Thanks,
> 
> Thomas
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
