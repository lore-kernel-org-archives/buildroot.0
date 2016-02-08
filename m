From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Mon,  8 Feb 2016 16:42:45 +0100
Subject: [Buildroot] [PATCH 1/1] skeleton: Rename /etc/profile.d/umask to
	umask.sh
Message-ID: <1454946165-8192-1-git-send-email-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

/etc/profile only sources files that matches the /etc/profile.d/*.sh
pattern, so /etc/profile.d/umask was never sourced.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 system/skeleton/etc/profile.d/{umask => umask.sh} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename system/skeleton/etc/profile.d/{umask => umask.sh} (100%)

diff --git a/system/skeleton/etc/profile.d/umask b/system/skeleton/etc/profile.d/umask.sh
similarity index 100%
rename from system/skeleton/etc/profile.d/umask
rename to system/skeleton/etc/profile.d/umask.sh
-- 
2.7.0
