From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Jul 2017 23:14:33 +0200
Subject: [Buildroot] [PATCH 2/4 v3] package/kvm-unit-tests: introduce
 _ARCH_SUPPORTS
In-Reply-To: <20170710215748.GD22898@scaer>
References: <cover.1499592591.git.yann.morin.1998@free.fr>
 <996d1d52c27da1a7725ed425ac895c3a7b5b7301.1499592591.git.yann.morin.1998@free.fr>
 <20170710180949.764a0fdb@windsurf.lan> <20170710162056.GB3014@scaer>
 <20170710234741.554c7a44@windsurf.lan> <20170710215748.GD22898@scaer>
Message-ID: <28d2cd39-27ca-4c60-1e58-37315cd7bc35@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-07-17 23:57, Yann E. MORIN wrote:
> As much as it is "possible" to change the version for the cross-gcc, the
> native compiler is often not replaceable. This is most probably the case
> on enterprise-grade servers, where users are not root (and are stuck
> with a precambrian host compiler)...

 Building a native compiler from source is annoying, but not impossible. Libc is
a different story, but a compiler is feasible. In addition, many users can
indeed install a decent compiler either from the distro or from a PPA, so really
it does make sense to have such a comment.

 What you *really* can't change is your target architecture and its features.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
