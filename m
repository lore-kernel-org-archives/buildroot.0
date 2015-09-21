From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 21 Sep 2015 19:17:18 +0200
Subject: [Buildroot] [PATCH 2/5] toolchain/external: rename Linaro arm
 and AArch64 options
In-Reply-To: <86fd4e995ad6ec4737cdd0b0c3a5c4c0f9a0123a.1442785491.git.yann.morin.1998@free.fr>
References: <cover.1442785491.git.yann.morin.1998@free.fr>
 <86fd4e995ad6ec4737cdd0b0c3a5c4c0f9a0123a.1442785491.git.yann.morin.1998@free.fr>
Message-ID: <56003B9E.4050108@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20-09-15 23:45, Yann E. MORIN wrote:
> We're going to add a new Linaro version (2015.02) for those toolchains,
> so we want to differentiate them.
> 
> Even though we could simply keep the current options as-is and just
> introduce the new ones suffixed with the version, it is better to rename
> the existing options for consistency with the new ones and wiith other
> multi-versions toolchains (like the CS CodeBench).

 Sorry to revisit the discussion on IRC, but in be2abf23 Thomas Petazzoni wrote:

    Linaro toolchains are released so frequently (every month) that it
    doesn't make much sense to support 3 consecutive versions. So, like we
    do for ARM big-endian, let's support only one version at a time.

 Are we in agreement that this has changed because it seems they now have stable
releases? Or let me put this differently: are we sure now that the 2015.02
version is really considered more stable than 2015.08, or is it just that
they're too lazy to update their website?

 Regards,
 Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
