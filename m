From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Fri, 29 Mar 2013 15:49:18 +0100 (CET)
Subject: [Buildroot] [PATCH 1/2] packages: add ability for packages
	to	create users
In-Reply-To: <201303081809.45387.yann.morin.1998@free.fr>
Message-ID: <1446827286.1045443.1364568558687.JavaMail.root@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


just a quick ping on this particular patch....

it's usefull at least for pulseaudio in system mode, which needs its own user and group.

Note that the pulseaudio documentation recommends never using pulseaudio as a system daemon except for headless embedded system.

So I think it's legitimate to handle this use case for buildroot :)

There are probably other daemons that can use their own user if that feature is available.

Regards

J?r?my Rosen
