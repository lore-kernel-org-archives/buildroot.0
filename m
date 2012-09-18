From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Sep 2012 23:27:39 +0200
Subject: [Buildroot] [PATCH 1/3] alsa-lib: put
 BR2_PACKAGE_ALSA_LIB_PYTHON under the existing if condition
In-Reply-To: <1347988898-5279-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1347988898-5279-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5058E74B.9080209@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/18/12 19:21, Thomas Petazzoni wrote:
> Instead of duplicating the "depends on BR2_PACKAGE_ALSA_LIB", just put
> BR2_PACKAGE_ALSA_LIB_PYTHON under the existing condition "if
> BR2_PACKAGE_ALSA_LIB".
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[snip]

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
