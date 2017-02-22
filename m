From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 22 Feb 2017 12:50:36 +0100
Subject: [Buildroot] [PATCH 1/2 next] Revert "reproducible: fix
 DATE/TIME macros in toolchain-wrapper"
In-Reply-To: <20170221220121.049d38a6@free-electrons.com>
References: <cover.1487709136.git.yann.morin.1998@free.fr>
 <0db12adda90ffa9bf7a3925cf1563aea4591c5ef.1487709136.git.yann.morin.1998@free.fr>
 <20170221214750.4c057f08@free-electrons.com> <20170221205435.GA3347@free.fr>
 <20170221220121.049d38a6@free-electrons.com>
Message-ID: <6881dd6c-140a-9cb3-a948-8cb7d0a4a8a4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21-02-17 22:01, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 21 Feb 2017 21:54:35 +0100, Yann E. MORIN wrote:
> 
>> It is needed to revert this patch in next before applying the following
>> patch.
> 
> Since it has already been reverted in master, I believe we will wait
> for the release, and next to be merged in master before applying.

 Alternatively, merge master into next now and apply patch 2 to next.

 Is there any reason not to regularly merge master into next?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
