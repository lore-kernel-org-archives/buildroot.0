From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 22:47:21 +0200
Subject: [Buildroot] [PATCH v5] dpdk: new package
In-Reply-To: <57168742.7090806@mind.be>
References: <1458642986-32365-1-git-send-email-viktorin@rehivetech.com>
 <1460826490-15614-1-git-send-email-viktorin@rehivetech.com>
 <20160417163814.03b67f53@free-electrons.com>
 <20160417155607.5861459.38806.3255@rehivetech.com>
 <20160417213544.2960f7cf@free-electrons.com>
 <20160417205607.5861459.29884.3259@rehivetech.com>
 <20160417230607.75d32331@free-electrons.com>
 <20160418102315.169c22ad@jvn> <571564B3.3030906@mind.be>
 <20160419142744.5b2651db@pcviktorin.fit.vutbr.cz>
 <57168742.7090806@mind.be>
Message-ID: <20160419224721.2978305a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Apr 2016 21:30:10 +0200, Arnout Vandecappelle wrote:

>   We can also still revert to depending on linux unconditionally like you have 
> now. How likely is it that dpdk will be used in practice with no kernel modules? 
> Or is this going to be more likely in the future, with heavier use of UIO and 
> device tree?

My proposal would indeed to revert back to depend on Linux
unconditionally, and see what happens later, like if we have users who
use DPDK and complain that it depends on the Linux kernel package.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
