From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 25 Sep 2012 14:55:21 +0200
Subject: [Buildroot] wpa_supplicant changes, the next round
Message-ID: <1348577725-12647-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

based on the very helpful comments from Arnout, here's another
series of patches for wpa_supplicant. The first patch is what I
submitted initially to gain options to enable the new DBus API
(now with hopefully all whitespace issues fixed).

The following three patches simplify the substitutions on the
.config file. You may decide to merge them into a single change,
but I thought it would be easier to review it this way.


Regards, Sven
