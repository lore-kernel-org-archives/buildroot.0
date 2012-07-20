From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 23:38:43 +0200
Subject: [Buildroot] [PATCH 3/5] libglib2: fix alignment checks
In-Reply-To: <1342646260-11203-4-git-send-email-s.neumann@raumfeld.com>
References: <1342646260-11203-1-git-send-email-s.neumann@raumfeld.com>
 <1342646260-11203-4-git-send-email-s.neumann@raumfeld.com>
Message-ID: <20120720233843.3e9dc2c3@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 18 Jul 2012 23:17:38 +0200,
Sven Neumann <s.neumann@raumfeld.com> a ?crit :

> The configure script fails to calculate alignments when cross-compiling.
> 
> This commit hardcodes alignments for 32 bit platforms. It will need to
> be adjusted for other platforms. Please advice on how to fix this properly.

OE is doing the same thing, so apparently, it seems like there isn't
any other obvious solution. We'll have to define those values for each
architecture.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
