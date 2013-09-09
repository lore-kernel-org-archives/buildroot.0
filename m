From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  9 Sep 2013 23:46:43 +0200
Subject: [Buildroot] [PATCH 0/2] fix files path after package/{multimedia =>
	} move
Message-ID: <1378763205-6180-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

Cset adf6511 moved packages from package/multimedia/ to package/
but forgot to change the paths of files referenced in the .mk files.

Fix this for two packages:

    [PATCH 1/2] package/mpd: fix files path after package/{multimedia => } move
    [PATCH 2/2] package/pulseaudio: fix files path after package/{multimedia => } move

Regards,
Yann E. MORIN.
