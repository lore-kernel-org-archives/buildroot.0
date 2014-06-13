From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 13 Jun 2014 17:59:01 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140613155033.GC15237@rmm-p1267483>
References: <20140613063010.B26041011DE@stock.ovh.net>
 <20140613111216.1fdae121@free-electrons.com>
 <20140613145515.GA15237@rmm-p1267483>
 <20140613170726.4db5e1cf@free-electrons.com>
 <20140613155033.GC15237@rmm-p1267483>
Message-ID: <20140613175901.1680260a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Eric Le Bihan,

On Fri, 13 Jun 2014 17:50:34 +0200, Eric Le Bihan wrote:

> > Ah, yes, right. Crazy that kernel headers as recent as 3.10 are needed
> > to build systemd...
> Systemd clearly misses some #ifdef's in some places to keep decent
> build requirements...

Yes :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
