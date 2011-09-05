From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Sep 2011 17:19:13 +0200
Subject: [Buildroot] [PATCH 2/4] manual: provide make targets to build
 the documentation
In-Reply-To: <201109050919.38009.arnout@mind.be>
References: <cover.1314827583.git.thomas.petazzoni@free-electrons.com>
 <2e6fc9dfc010ecdd3b3c4f541d5175a7bbf540a8.1314827583.git.thomas.petazzoni@free-electrons.com>
 <201109050919.38009.arnout@mind.be>
Message-ID: <20110905171913.35a866ff@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Le Mon, 5 Sep 2011 09:19:36 +0200,
Arnout Vandecappelle <arnout@mind.be> a ?crit :

> On Wednesday 31 August 2011 23:54:20, Thomas Petazzoni wrote:
> > +manual-splitted-html: $(MANUAL_SOURCES)
> > +       @echo "Splited HTML manual..."
> 
>  I don't think 'splitted' is proper English; it should be 'split'.

This is very possible. I have fixed the Makefile, and also added
support to generate the documentation in the epub format. I've pushed
this new version at the same location.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
