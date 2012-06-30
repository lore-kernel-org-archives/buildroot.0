From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 30 Jun 2012 19:46:51 +0200
Subject: [Buildroot] [PATCH] Add /var/www to device table
In-Reply-To: <1340654541-10427-1-git-send-email-spdawson@gmail.com>
References: <1340654541-10427-1-git-send-email-spdawson@gmail.com>
Message-ID: <4FEF3B8B.8020506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/25/12 22:02, spdawson at gmail.com wrote:
> From: Simon Dawson<spdawson@gmail.com>
>
> The /var/www directory is listed in /etc/passwd in the skeleton target
> filesystem as the home directory of the www-data user (uid 33).
>
> In the final target filesystem, /var/www should be owned by www-data. This
> is important for the lighttpd package, for example.
>
> Signed-off-by: Simon Dawson<spdawson@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  There's a redundant tab in the /var/www line, however.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
