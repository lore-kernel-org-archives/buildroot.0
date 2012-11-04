From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 04 Nov 2012 12:39:57 +0100
Subject: [Buildroot] [PATCH] QT: Fix build for architectures using
 generic atomics
In-Reply-To: <1352027774-27536-1-git-send-email-mischa.jonker@synopsys.com>
References: <1352027774-27536-1-git-send-email-mischa.jonker@synopsys.com>
Message-ID: <5096540D.7040401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/04/12 12:16, Mischa Jonker wrote:
> The problem has to do with const-correctness. This has been resolved
> for various architectures, but not for the generic case.
>
>      Signed-off-by: Mischa Jonker<mischa.jonker@synopsys.com>

  Looks like a horrible hack, but since there's nothing better upstream:

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (untested)

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
