From: Sven Neumann <s.neumann@raumfeld.com>
Date: Wed,  7 Mar 2012 23:38:16 +0100
Subject: [Buildroot] add option to enable AI_ADDRCONFIG support
Message-ID: <1331159898-25350-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


This patchset adds a buildroot option to enable AI_ADDRCONFIG support
in uClibC. It also changes the mrouted package to select the new option
instead of hinting the user in a comment that it depends on it.

If this is accepted I will also re-submit the gupnp packages that I
tried to get into buildroot before. Until now this failed because
gssdp needs ifaddr.h which is only available with uClibC if
AI_ADDRCONFIG support is enabled.
