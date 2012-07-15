From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 15 Jul 2012 13:50:36 +0200
Subject: [Buildroot] [PATCH v3 2/2] libglib2: fix install even if the
 host python binary refers to python3
In-Reply-To: <1338674897-1810-2-git-send-email-s.martin49@gmail.com>
References: <1338674897-1810-1-git-send-email-s.martin49@gmail.com>
 <1338674897-1810-2-git-send-email-s.martin49@gmail.com>
Message-ID: <5002AE8C.7060905@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/03/12 00:08, Samuel Martin wrote:
> The libglib2's build system uses some python2 scripts in the install rules.
>
> This patch ensures to have a valid host python2 binary and enforces this python2
> binary at configure-time.
>
> Signed-off-by: Samuel Martin<s.martin49@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  And a bump.

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
