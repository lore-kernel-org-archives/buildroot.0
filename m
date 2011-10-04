From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 4 Oct 2011 18:20:16 +0200
Subject: [Buildroot] How to create package that build with scons
In-Reply-To: <20111004105449.GB22823@sapphire.tkos.co.il>
References: <CANc=jjo0e1tvgSm2KTiFaxBd3pPW4zJs=pZ8HVsyFCYGhyLqnw@mail.gmail.com>
 <20111004105449.GB22823@sapphire.tkos.co.il>
Message-ID: <201110041820.16324.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Tuesday 04 October 2011 12:54:50, Baruch Siach wrote:
> Now I see that the package/scons/scons.mk file (from commit cae6d239) is
> not  referenced anywhere, so it looks broken currently. Thomas, can you
> comment on this?

 'make host-scons' works for me...

 There is currently no package that depends on scons, but I guess that it was 
used by some private package of Thomas (or one of his customers).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
