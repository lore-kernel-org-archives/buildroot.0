From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Dec 2012 08:17:32 +0100
Subject: [Buildroot] [PATCH] barebox: use the symlink to copy the
 barebox binary to the images directory
In-Reply-To: <1353587711-26855-1-git-send-email-gregory.hermant@calao-systems.com>
References: <1353587711-26855-1-git-send-email-gregory.hermant@calao-systems.com>
Message-ID: <50C58C8C.8080205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22/11/12 13:35, Gregory Hermant wrote:
> Barebox creates a symlink to the binary. This symlink points to
> the barebox.bin or to the compressed zbarebox.bin binary.
>
> Signed-off-by: Gregory Hermant<gregory.hermant@calao-systems.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
