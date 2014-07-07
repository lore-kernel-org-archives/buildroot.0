From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 07 Jul 2014 18:34:52 +0200
Subject: [Buildroot] [PATCH 4/6] systemd: bump to version 214
In-Reply-To: <1404406659-31109-5-git-send-email-eric.le.bihan.dev@free.fr>
References: <1404406659-31109-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1404406659-31109-5-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <53BACC2C.8050203@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/07/14 18:57, Eric Le Bihan wrote:
> This patch bumps systemd to version 214.
> 
> Changes:
> 
> - add new users: systemd-bus-proxy, systemd-network and systemd-resolve.
> - remove gtk-doc patch, as it is no longer needed.
> - remove attr dependency.
> - enable nss-myhostname.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 It would be good however if you could explain in the commit log why removing
attr and enabling myhostname is OK.


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
