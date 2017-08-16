From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 16 Aug 2017 21:34:25 +0200
Subject: [Buildroot] Failing defconfigs due to GCC 6
In-Reply-To: <767EFADFF809234DB6CAABD6D2F93847C5D6E939@IRSMSX107.ger.corp.intel.com>
References: <15ef0875-b514-cb30-02df-d5d413bb0ea9@mind.be>
 <767EFADFF809234DB6CAABD6D2F93847C5D6E939@IRSMSX107.ger.corp.intel.com>
Message-ID: <1d7655be-bd3f-6656-5cd9-18f8f96d9926@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-08-17 22:38, Kinsella, Ray wrote:
> Hi Arnout,
> 
> The Galileo and Galileo Gen 2 are supported by the upstream kernel, so that would be simplest approach.
> Some minor non-upstream fixes will however be lost along the way.
> 
> The biggest obstacle is that I wouldn't be able to do anything on this until at least mid-September (due to travel).
> Would be a pity to see Galileo support depreciated in BR.

 If you're sure that you can update this defconfig later, I'll for now make a
patch that just fixes GCC to version 5.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
