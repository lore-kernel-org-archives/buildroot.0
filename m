From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 28 May 2015 21:47:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/shairport-sync: Add musl patches
In-Reply-To: <1432801431-16986-1-git-send-email-joerg.krause@embedded.rocks>
References: <1432801431-16986-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <556770D9.9030001@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/28/15 10:23, J?rg Krause wrote:
> Add patches to fix the following issues:
>   - shairport-sync crashes on musl libc because of a stack overflow
>   - warning about incorrect header includes for poll.h and signal.h
> 
> Both patches PR'ed upstream:
> https://github.com/mikebrady/shairport-sync/pull/78
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Patches have been accepted upstream now. Probably good to include in 2015.05.

 Regards,
 Arnout


-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
