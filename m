From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Wed, 5 Oct 2016 13:46:11 +0530
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2016-10-04
In-Reply-To: <20161005063025.85A591027E8@stock.ovh.net>
References: <20161005063025.85A591027E8@stock.ovh.net>
Message-ID: <57F4B6CB.4030402@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wednesday 05 October 2016 12:00 PM, Thomas Petazzoni wrote:
> Hello,
>
> This is the list of Buildroot build failures that occured on
> 2016-10-04, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
>
> Build failures related to your packages:
>
>          bfin |                    glog-v0.3.4 | http://autobuild.buildroot.net/results/c41a7e2dbd03f9ac0017692c2fff2f86b5a1a599
>          bfin |                    glog-v0.3.4 | http://autobuild.buildroot.net/results/c7eaf6f05e5b66032fcc822ceec935295b651997
>

bfin config on autobuilder is using old prebuild toolchain instead of 
new one (br-bfin-full-2016.08-364-ga92d0da.tar.bz2) which has a fix for 
this build issue. Earlier I mentioned about it in other thread [1].


Thanks,
Rahul

[1] - 
http://lists.busybox.net/pipermail/buildroot/2016-September/172771.html
