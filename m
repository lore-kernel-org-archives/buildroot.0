From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 Jan 2012 12:36:17 +0100
Subject: [Buildroot] [PATCH v2] bash: Adding features that can not be
	automatically detected while cross-compiling
In-Reply-To: <87wr8qnd1c.fsf@macbook.be.48ers.dk>
References: <1326820937-28384-1-git-send-email-arnout@mind.be>
 <1326821128-29133-1-git-send-email-arnout@mind.be>
 <87wr8qnd1c.fsf@macbook.be.48ers.dk>
Message-ID: <201201181236.17419.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 18 January 2012 00:07:43 Peter Korsgaard wrote:
> Ok, but does it make sense to make these things configurable? I haven't
> checked, but presumably these are supported on all Linux archs, and
> don't affect the binary size significantly (compared to bash size)?

 By the way, on ARM it increases the size from 878K to 879K...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
