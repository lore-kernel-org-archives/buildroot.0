From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 18 Jun 2015 01:09:04 +0200
Subject: [Buildroot] [RFC v3 00/30] Add per-package staging feature
In-Reply-To: <20150615111757.03ec0b48@free-electrons.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
 <20150612221456.44a97ad5@free-electrons.com>
 <CAHkwnC_J+7jXL7RT=7-HDhg3S-0ketM3p4VZs9cC0BUA6_qNpg@mail.gmail.com>
 <20150615111757.03ec0b48@free-electrons.com>
Message-ID: <5581FE10.8090103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/15/15 11:17, Thomas Petazzoni wrote:
[snip]
> Also, and while this is definitely reaching much further than doing
> top-level parallel build, I'm wondering if we shouldn't do the
> Buildroot builds within a well-controlled chroot. This would allow us
> to control the host environment, and ultimately cache the build results
> and re-use them across builds. This is clearly not simple, as we need
> to capture all the dependencies that have been built, their version,
> their configuration, etc. I have no idea if it is reasonable to do that
> in Buildroot, or if it is really too complicated to be compatible with
> the "keep it simple" principle of Buildroot.

 That starts to smell more and more like NixOS... I.e., too complicated for
buildroot. But if someone proposes a patch and its diffstat looks acceptable,
the option is of course still open.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
