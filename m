From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Apr 2014 00:20:06 +0200
Subject: [Buildroot] [PATCH] samba4: bump to version 4.1.7 and improve
 cross build
In-Reply-To: <1398211678-20218-1-git-send-email-gustavo@zacarias.com.ar>
References: <1398211678-20218-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <53583C96.3030008@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/04/14 02:07, Gustavo Zacarias wrote:
> Bump to the latest 4.1.7 version and improve the cross-build logic.
> With the new patches the build is basically architecture-agnostic making
> it possible to ditch the arch-specific cache to use a generic one.
> Some toolchains might not be too happy with samba4 because of bitrot,
> hopefully we'll find and fix or blacklist those with autobuilder help.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
