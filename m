From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
Date: Sat, 18 Jul 2015 00:30:18 +0200
Subject: [Buildroot] [PATCHv2] gptfdisk: bump version 1.0.0
In-Reply-To: <1436811980-17812-1-git-send-email-aurelien@chabot.fr>
References: <1436811980-17812-1-git-send-email-aurelien@chabot.fr>
Message-ID: <1437172219-3978-1-git-send-email-aurelien@chabot.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In this latest patch revision, I just remove the diff of ncurses vs ncursesw,
my build issue where most probably due to a wrong compilation step from myself.

Aur?lien Chabot (1):
  gptfdisk: bump version 1.0.0

 package/gptfdisk/gptfdisk.hash | 6 +++---
 package/gptfdisk/gptfdisk.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.4.6
