From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Nov 2012 21:22:51 +0100
Subject: [Buildroot] [PATCH v2] kexec: disable on avr32
In-Reply-To: <1352796707-9197-1-git-send-email-spdawson@gmail.com>
References: <1352796707-9197-1-git-send-email-spdawson@gmail.com>
Message-ID: <50A2AC1B.4090501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/11/12 09:51, spdawson at gmail.com wrote:
> From: Simon Dawson<spdawson@gmail.com>
>
> kexec does not support the avr32 architecture; this results in autobuilder
> failures such as the following.
>
>    http://autobuild.buildroot.net/results/5f5e91c3eb622bce88402a9afc8a3e7bd5007136/build-end.log
>
> This patch disables support for the kexec package on the avr32 architecture.
>
> Signed-off-by: Simon Dawson<spdawson@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
