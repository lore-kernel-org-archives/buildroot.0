From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Jun 2014 18:41:47 +0200
Subject: [Buildroot] [Patch v3 1/1] systemd: rework network/tty units
 installation
In-Reply-To: <1403517126-5776-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1403517126-5776-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <53A858CB.2060109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/06/14 11:52, Eric Le Bihan wrote:
> The installation of the network.service and serial-getty.service unit
> files are now performed via the <pkg>_INIT_SYSTEMD mechanism instead of
> an installation hook.
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
