From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 16 Sep 2013 23:40:32 +0200
Subject: [Buildroot] [PATCHv2 3/4] core: allow external defconfigs to be
 used
In-Reply-To: <1379185433-8770-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1379185433-8770-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1379185433-8770-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <52377AD0.9010102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/09/13 21:03, Thomas Petazzoni wrote:
> This commit allows the user to store defconfigs in
> $BR2_EXTERNAL/configs/. To achieve this:
>
>   * It adds a new %_defconfig that looks in $BR2_EXTERNAL/configs/ for
>     the corresponding defconfig file.
>
>   * Updates the help target to also list external defconfigs.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>

  Looks good!

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
