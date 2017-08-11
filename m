From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Aug 2017 11:53:30 +0200
Subject: [Buildroot] [PATCH] toolchain-wrapper: do not use deprecated
 -mfused-madd
In-Reply-To: <20170811080858.336ba4d3@windsurf>
References: <20170811052847.GA32348@waldemar-brodkorb.de>
 <20170811080858.336ba4d3@windsurf>
Message-ID: <7a3aef53-510d-a620-5980-d3c780eb5ddd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-08-17 08:08, Thomas Petazzoni wrote:
> Hello,
> 
> On Fri, 11 Aug 2017 07:28:48 +0200, Waldemar Brodkorb wrote:
>> GCC deprecated -mfused-madd, -ffp-contract=off should
>> be used for Xburst workaround.
>> uClibc compilations will fail, because a gcc warning
>> is emitted while checking for TLS support in the compiler.
> 
> In which gcc version was -ffp-contract=off added ? Can we use that
> unconditionally, or is it only available in recent gcc versions ?

 And remember that we support GCC down to 4.3 in external toolchains...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
