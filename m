From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 17:16:02 +0200
Subject: [Buildroot] buildroot for SAMA5D3 illegal instruction
In-Reply-To: <55AFB25A.8040408@mydatex.cz>
References: <55AF3847.503@mydatex.cz>
 <20150722085912.66ff27e0@free-electrons.com>
 <55AF3FF8.4020305@mydatex.cz> <55AFB25A.8040408@mydatex.cz>
Message-ID: <20150722171602.766be19e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Daniel Smolik,

On Wed, 22 Jul 2015 17:10:18 +0200, Daniel Smolik wrote:

> Many many thanks. Problem was in kernel headers. I run kernel 3.12.44
> and use wrong headers.

Glad to hear it solved the problem.

This makes me wonder if using always the latest and greatest kernel
headers by default in Buildroot is a good idea, because it clearly
won't match what most people will need.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
