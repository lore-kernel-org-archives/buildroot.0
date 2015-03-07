From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 07 Mar 2015 17:14:29 +0100
Subject: [Buildroot] [git commit] toolchain: add link-time-optimization
 support
In-Reply-To: <20150307142749.E241880468@busybox.osuosl.org>
References: <20150307142749.E241880468@busybox.osuosl.org>
Message-ID: <54FB23E5.3050707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/03/15 15:01, Thomas Petazzoni wrote:
> Individual packages still have to enable LTO explicitly by passing '-flto' to
> GCC, which passes it on to the linker. This option does not add that flag
> globally. Some packages detect if the compiler supports LTO and enable the flag
> if it does.

 Given that this new option (probably) changes how some packages are built, I
think there should be a few autobuilder configs that enable it. Any volunteers
to take care of that?

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
