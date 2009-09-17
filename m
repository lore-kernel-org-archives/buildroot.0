From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Sep 2009 19:31:30 +0200
Subject: [Buildroot] root templates
In-Reply-To: <001101ca3790$54bb9bc0$7401a8c0@apexlaptop>
References: <001101ca3790$54bb9bc0$7401a8c0@apexlaptop>
Message-ID: <20090917193130.46360177@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 17 Sep 2009 14:13:56 +0200,
"Sagaert Johan" <sagaert.johan@skynet.be> a ?crit :

> I see drastic changes are done in buildroot , maybe consider the fact
> that until now, every project you start uses the same root template.
> So there maybe a system that allows for several different templates
> to choose from. eg in the main project menu, one could for example
> list the templates available for that architecture including custom
> made templates.

This is already possible, but undocumented. By documentation patch
(patch 6/6) sent yesterday adds documentation on how to do this.

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
