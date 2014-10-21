From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Oct 2014 10:33:39 +0200
Subject: [Buildroot] [PATCH 2/2 v5] package/mono: new package
In-Reply-To: <54458B8C.4020505@crapouillou.net>
References: <54458B8C.4020505@crapouillou.net>
Message-ID: <20141021103339.7beae145@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Paul Cercueil,

On Tue, 21 Oct 2014 00:24:12 +0200, Paul Cercueil wrote:

> Your package does not work here, host-mono fails to build.
> I attached the log file.
> 
> Could the DLL files be downloaded instead of rebuilt? They should be
> arch-independent, so it may be easier and faster to just download them.
> Then only the runtime would need to be built.

Which DLL are you talking about? host-monolite already downloads a
bunch of pre-built DLLs.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
