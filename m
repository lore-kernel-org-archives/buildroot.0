From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Apr 2014 11:50:46 +0200
Subject: [Buildroot] [PATCH 0/2] postgresql fix and update
In-Reply-To: <1398036313-26556-1-git-send-email-ps.report@gmx.net>
References: <1398036313-26556-1-git-send-email-ps.report@gmx.net>
Message-ID: <20140421115046.60bffaca@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Mon, 21 Apr 2014 01:25:11 +0200, Peter Seiderer wrote:

> thanks for applying the postgresql package (and for reporting the
> uClibc bug upstream).
> 
> Here two follow up patches (sorry for missing to disable the
> automatic readline/zlib selection in the last version).

Related to postgresql, can you have a look at the build problem
reported at
http://autobuild.buildroot.org/results/32f/32fc178cc3875c32e9b722654676fc44eccde8f1/build-end.log ?
The configuration is visible at
http://autobuild.buildroot.org/results/32f/32fc178cc3875c32e9b722654676fc44eccde8f1/config.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
