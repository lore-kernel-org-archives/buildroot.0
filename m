From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Jan 2013 13:51:36 +0100
Subject: [Buildroot] [PATCH 3/5] package/customize: remove
In-Reply-To: <1358363393-29977-4-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358363393-29977-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1358363393-29977-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <50FA96D8.40707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/01/13 20:09, Thomas Petazzoni wrote:
> This mechanism of root filesystem customization has been deprecated
> since a long time, so let's remove it now.
>
> Signed-off-by: Thomas Petazzoni<thomas.petazzoni@free-electrons.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  It can also be removed from pkg-stats.

  And maybe it should be added to Config.in.legacy?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
