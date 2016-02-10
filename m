From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Feb 2016 07:49:04 +0100
Subject: [Buildroot] [git commit] skeleton: Rename /etc/profile.d/umask to
	umask.sh
Message-ID: <20160210065450.39FD6818A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=670fa0c96fb8fa06c924ddbc3bc28a8e66a5ca33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

/etc/profile only sources files that matches the /etc/profile.d/*.sh
pattern, so /etc/profile.d/umask was never sourced.

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/skeleton/etc/profile.d/{umask => umask.sh} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/system/skeleton/etc/profile.d/umask b/system/skeleton/etc/profile.d/umask.sh
similarity index 100%
rename from system/skeleton/etc/profile.d/umask
rename to system/skeleton/etc/profile.d/umask.sh
