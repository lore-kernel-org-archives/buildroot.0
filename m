From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 03 Nov 2014 21:38:31 +0100
Subject: [Buildroot] [PATCH 0/2] RWD Website
In-Reply-To: <CA+TH9VmauW8nHEy86AH-dU11f4cVceMk=1MVXMdEkjx_41HQSQ@mail.gmail.com>
References: <1414770651-23358-1-git-send-email-angelo.compagnucci@gmail.com>
 <20141101144354.66e2e698@free-electrons.com>
 <CA+TH9VmauW8nHEy86AH-dU11f4cVceMk=1MVXMdEkjx_41HQSQ@mail.gmail.com>
Message-ID: <5457E7C7.9050602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 [Legal stuff so putting Luca in CC]

On 02/11/14 22:14, Angelo Compagnucci wrote:
[snip]
> Some tweaks are missing in vanilla bootstrap css, I tweaked a little
> to match the colour theme and font of the older website. You can find
> the right version here:
> 
> http://buildrootrd.idea-on-line.it/css/bootstrap.min.css

 This comment makes me realize something: we are only carrying the minified
version of jquery and bootstrap. As such that's not a problem, because they're
MIT licensed. However, when you distribute the buildroot source, it is
conceivable to consider jquery and bootstrap as part of "the Program" according
to the GPL. In that case, the GPL would require you to provide the complete
corresponding source, i.e. including the source of jquery and bootstrap.

 Although this is probably an unrealistic interpretation of the situation, I
think it would certainly simplify everybody's life if we would just carry a copy
of the source of bootstrap and jquery. _Especially_ if we're going to modify it.


 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
