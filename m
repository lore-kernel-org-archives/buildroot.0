From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Sep 2015 14:21:27 +0200
Subject: [Buildroot] [PATCHv5 3/4] Makefile: implement a size-stats
 target
In-Reply-To: <20150903102905.GC3689@free.fr>
References: <1441228505-23235-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1441228505-23235-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150903102905.GC3689@free.fr>
Message-ID: <20150903142127.528cbc63@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Thu, 3 Sep 2015 12:29:05 +0200, Yann E. MORIN wrote:

> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks!

> I would however have called this something like graph-sizes, so it is in
> line with the other graph-generating targets.

It used to be called graph-size, until I changed the code to also
generate CSV files. So now it doesn't generate just a graph, but also
raw CSV data, which is why I changed to size-stats. If despite that
you think "make graph-size" remains a better naming, I'm fine with
changing back.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
