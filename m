From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 09 Jul 2012 22:04:00 +0200
Subject: [Buildroot] [PATCH] Add /var/www to device table
In-Reply-To: <1341838311-14605-1-git-send-email-spdawson@gmail.com>
References: <1341838311-14605-1-git-send-email-spdawson@gmail.com>
Message-ID: <4FFB3930.6010400@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/09/12 14:51, spdawson at gmail.com wrote:
> The /var/www directory is listed in /etc/passwd in the skeleton target
> filesystem as the home directory of the www-data user (uid 33).
>
> In the final target filesystem, /var/www should be owned by www-data. This
> is important for the lighttpd package, for example.
>
> Signed-off-by: Simon Dawson<spdawson@gmail.com>

  You forgot to add my
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

> ---
>   v2: Removed redundant TAB from line added device table file.

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
