From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 23:39:42 +0200
Subject: [Buildroot] [PATCH 5/5] libglib2: do not use xlocale
In-Reply-To: <1342646260-11203-6-git-send-email-s.neumann@raumfeld.com>
References: <1342646260-11203-1-git-send-email-s.neumann@raumfeld.com>
 <1342646260-11203-6-git-send-email-s.neumann@raumfeld.com>
Message-ID: <20120720233942.353b4c7e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 18 Jul 2012 23:17:40 +0200,
Sven Neumann <s.neumann@raumfeld.com> a ?crit :

> The xlocale based implementations of g_ascii_strto{d,ll,ull}
> and g_ascii_formatd crash with uClibC 0.9.32 (and probably other
> versions as well). So trick the configure script into believing
> that this functionality was not available so that the good old
> home-grown code is used again (as was the case with glib 2.30).
> 
> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>

Have you tried with uClibc 0.9.33 ? Is there a fix available ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
