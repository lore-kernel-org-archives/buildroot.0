From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Fri, 26 Aug 2016 14:50:29 +0530
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2016-08-23
In-Reply-To: <20160824172543.19BA410CCE6@stock.ovh.net>
References: <20160824172543.19BA410CCE6@stock.ovh.net>
Message-ID: <57C009DD.9070309@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wednesday 24 August 2016 10:55 PM, Thomas Petazzoni wrote:
> Hello,
>
> This is the list of Buildroot build failures that occured on
> 2016-08-23, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
>
> Build failures related to your packages:
>
>          bfin |                    glog-v0.3.4 | http://autobuild.buildroot.net/results/914cc267eba357cc0c425f07e57c6ae35b099b7e
>

We have disabled glog on blackfin external toolchain uclinux sometime 
back [1]. But we are seeing same issue with buildroot based toolchain now.

As elf-fdpic.h is only provided by uClibc and we support only uClibc for 
blackfin, should we disable glog on blackfin ?

Regards,
Rahul

[1] - 
https://git.buildroot.net/buildroot/commit/?id=3b198722a5cfdf2ad5fd5a243aaa5f9f730b0101
