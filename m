From: Julien Letessier <julien.letessier@technosens.fr>
Date: Fri, 8 Jun 2007 15:53:00 +0200
Subject: [Buildroot] X11R7 package(s)
In-Reply-To: <Pine.LNX.4.58.0706081157250.22966@jule.tellus>
References: <f0528b5b0706080128k7ade6f8k3e0cd6c18be550c1@mail.gmail.com>
	<Pine.LNX.4.58.0706081157250.22966@jule.tellus>
Message-ID: <f0528b5b0706080653lc06032fmf3514f7ad53f00d2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Great!
I'm also almost done with X11R7, so I suppose we should compare our solutions.

FYI, I'm creating one package per X module. My objective is to be able
to build only the necessary drivers, much like for the kernel.

Currently I'm using a small Python script to generate all the *.mk and
Config.in's from a "packages.ini" description file. I created
additional packages for the non-X dependancies that are not in
buildroot either (Mesa, libdrm and libxcb).
Using Benjamin Tietz's autotools meta-makefile might be a prettier solution.

What's your opinion about this approach?
-- 
Julien Letessier
<julien.letessier@technosens.fr>
