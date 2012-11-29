From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 29 Nov 2012 23:44:57 +0100
Subject: [Buildroot] [PATCH 1/1] strace: remove undef-CTL_PROC patch
In-Reply-To: <1354209118-12653-1-git-send-email-james.hogan@imgtec.com>
References: <1354209118-12653-1-git-send-email-james.hogan@imgtec.com>
Message-ID: <50B7E569.70804@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/11/12 18:11, James Hogan wrote:
> This patch is no longer necessary since strace-v4.5.15 which always
> defines CTL_PROC. Specifically strace git commit
> 35a55785ea8ff44d214af52085e3a5ea624730aa.
>
> Signed-off-by: James Hogan<james.hogan@imgtec.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
