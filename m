From: Ashish_Kumar_Mishra <dgashu55@gmail.com>
Date: Thu, 5 Jan 2017 00:34:11 -0800 (PST)
Subject: [Buildroot] Kernel Panic with BB Black + buildroot-2016.11.1
In-Reply-To: <1483593212540-153987.post@n4.nabble.com>
References: <1483536685380-153942.post@n4.nabble.com>
 <87bmvm2303.fsf@dell.be.48ers.dk> <1483593212540-153987.post@n4.nabble.com>
Message-ID: <1483605251342-153991.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All , 
I tried multiple options today the observation of which are shared here :-

ToolChain ( Linaro ARM 2016.05 ) + Kernel (4.8.11) + Uboot ( 2016.09.01 ) 
=> Panic
ToolChain ( Linaro ARM 2016.05 ) + Kernel (4.6)      + Uboot ( 2016.09.01 ) 
=> Panic
ToolChain ( Linaro ARM 2016.05 ) + Kernel (4.8.11) + Uboot ( 2016.03 )      
=> Boots Properly with NO PANIC
ToolChain ( Linaro ARM 2016.05 ) + Kernel (4.6)      + Uboot ( 2016.03 )      
=> Boots Properly with NO PANIC

Hence i can observe that with the latest UBOOT beagle bone black creates an
PANIC daily_scratch.txt
<http://buildroot-busybox.2317881.n4.nabble.com/file/n153991/daily_scratch.txt> 
. 

The console log for various cases are attached along .



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Kernel-Panic-with-BB-Black-buildroot-2016-11-1-tp153942p153991.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
