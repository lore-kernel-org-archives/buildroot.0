From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Dec 2020 10:55:55 +0100
Subject: [Buildroot] [PATCH 1/1] package/libglib2: bump version to 2.66.3
In-Reply-To: <20201123213557.789056-1-mbrunelle@distech-controls.com> (Maxime
 Brunelle via buildroot's message of "Mon,
 23 Nov 2020 16:35:57 -0500")
References: <20201123213557.789056-1-mbrunelle@distech-controls.com>
Message-ID: <87v9d6yqqc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Brunelle via buildroot <buildroot@busybox.net> writes:

 > Fixes https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/issues/524
 > package/libglib2 reference: https://gitlab.gnome.org/GNOME/glib/-/issues/2091

 > Signed-off-by: Maxime Brunelle <mbrunelle@distech-controls.com>

What should we do about the stable branches (2020.02.x / 2020.08.x /
2020.11.x)? When was this issue introduced?

I see:

2020.02.x: glib 2.62.5, nm 1.20.4
2020.08.x: glib 2.64.4, nm 1.22.10
2020.11.x: glib 2.64.4, nm 1.22.10

Master had the same glib / nm versions before this patch, so 2020.08.x /
2020.11.x are presumably also affected? What about 2020.02.x?

-- 
Bye, Peter Korsgaard
