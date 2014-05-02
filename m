From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 03 May 2014 00:00:03 +0200
Subject: [Buildroot] host-pkgconf: use --static option for static builds
In-Reply-To: <53625154.7030701@imgtec.com>
References: <1394021977-60055-1-git-send-email-Vincent.Riera@imgtec.com>
 <20140408035851.GK4096@tarshish> <20140501124909.GX4531@tarshish>
 <53625154.7030701@imgtec.com>
Message-ID: <53641563.5020903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/05/14 15:51, Vicente Olivert Riera wrote:
> I was talking with ThomasP about the same thing. He told me that it has huge
> consequences and can't be committed easily, because it affects how almost all
> packages are built in a BR2_PREFER_STATIC_LIB=y build.

 That's a bit a strange argument... If it doesn't get committed, it will never
be tested. We have a month to fix autobuilder failures, that should be enough, no?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
