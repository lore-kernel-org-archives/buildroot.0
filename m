From: Simon Dawson <spdawson@gmail.com>
Date: Sun, 3 Jun 2012 19:50:48 +0100
Subject: [Buildroot] [PATCH] gstreamer: add xorg support
In-Reply-To: <20120603152351.2faa4341@skate>
References: <1338726592-3168-1-git-send-email-spdawson@gmail.com>
 <20120603152351.2faa4341@skate>
Message-ID: <CAHt8ZCN+96C0Hrj_Wh9KhfKOJic10B1NH-q8aB7SQuKp5hF06Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Are you sure that the dependency is on xserver_xorg-server? I would
> rather suspect that the real dependency is on a certain set of X11
> client libraries (libX11 for the core protocol, libXv fdor the Xvideo
> extension, etc.).

Right you are, thanks; I'll fix this and resubmit.

Simon.
