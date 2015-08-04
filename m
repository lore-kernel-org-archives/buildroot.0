From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Aug 2015 15:38:25 +0200
Subject: [Buildroot] [PATCH 1/1] python-colorama: new package
In-Reply-To: <55C0BEC6.8040207@datacom.ind.br>
References: <1438634219-22000-1-git-send-email-farina@datacom.ind.br>
 <20150804105537.3a5e47f6@free-electrons.com>
 <55C0BEC6.8040207@datacom.ind.br>
Message-ID: <20150804153825.3a46c00e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 04 Aug 2015 10:31:50 -0300, DATACOM - Farina wrote:

> > Do you intend to submit some packages that will use
> > host-python-colorama?
> 
> At this specific moment, no. But we are analyzing the ARM mbed package, 
> which are widely used libraries and tools for ARM microcontrollers, and 
> makes use of host-python-colorama on its build-system.

But why do you use Buildroot to build something for a micro-controller?
I don't really see the connection between using ARM mbed and Buildroot.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
