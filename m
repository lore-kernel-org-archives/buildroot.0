From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 4 Aug 2017 22:11:04 +0200
Subject: [Buildroot] [PATCH] glibc: add patch fixing the build with
 binutils 2.29
In-Reply-To: <20170803213027.27565-1-thomas.petazzoni@free-electrons.com>
References: <20170803213027.27565-1-thomas.petazzoni@free-electrons.com>
Message-ID: <80269a11-68f6-6d43-f20f-d8d50576c7b4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-08-17 23:30, Thomas Petazzoni wrote:
> Fixes the following build failure, which occurs on all architectures:
> 
> /tmp/cc6APNmN.s: Assembler messages:
> /tmp/cc6APNmN.s: Error: `loc1 at GLIBC_2.17' can't be versioned to common symbol 'loc1'
> /tmp/cc6APNmN.s: Error: `loc2 at GLIBC_2.17' can't be versioned to common symbol 'loc2'
> /tmp/cc6APNmN.s: Error: `locs at GLIBC_2.17' can't be versioned to common symbol 'locs'
> ../o-iterator.mk:9: recipe for target '/tmp/output/build/glibc-2.25/build/misc/regexp.os' failed
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>


 Applied to master, thanks.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
