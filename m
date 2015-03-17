From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Mar 2015 21:29:39 +0100
Subject: [Buildroot] [PATCH v3 3/8] postgresql: enable bfin compile
In-Reply-To: <trinity-d7a2b402-806b-4ff1-8f3e-69ce39c68b1c-1426623962608@3capp-gmx-bs62>
References: <trinity-d7a2b402-806b-4ff1-8f3e-69ce39c68b1c-1426623962608@3capp-gmx-bs62>
Message-ID: <20150317212939.31518ebc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Tue, 17 Mar 2015 21:26:02 +0100, Peter Seiderer wrote:

> The only minor purpose leftover is as gcc ICE exampel for 'bfin-uclinux-gcc (ADI-2014R1-RC2) 4.3.5' (see [1])...

I don't understand, why do you say it's the "only minor purpose
leftover" ? 

If PostgreSQL uses fork(), it *cannot* work on noMMU architecture, so
there is no way to build PostgreSQL on Blackfin.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
