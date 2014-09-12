From: =?windows-1252?Q?J=F6rg_Krause?= <jkrause@posteo.de>
Date: Fri, 12 Sep 2014 11:01:26 +0200
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140912101105.1e932cb8@free-electrons.com>
References: <20140912063012.AF99B100DEE@stock.ovh.net>
 <20140912101105.1e932cb8@free-electrons.com>
Message-ID: <5412B666.10101@posteo.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 09/12/2014 10:11 AM, Thomas Petazzoni wrote:
> Hello,
>
> Samuel, Anton, Nathaniel, Vicente, Peter, Bernd, please see below.
>
>>        bfin | libshairplay-139d5ef5556451... | NOK | http://autobuild.buildroot.net/results/561817d8b3156b537f4bf76eb539658144a6efb4/
>>        bfin | libshairplay-139d5ef5556451... | NOK | http://autobuild.buildroot.net/results/5e7bb6c3c1bde627fc8129b734f3f9222c2331e9/
>>        bfin | libshairplay-139d5ef5556451... | NOK | http://autobuild.buildroot.net/results/b27466d56518e47d75cc437a962ae3c3a9a2aa3e/
>>        bfin | libshairplay-139d5ef5556451... | NOK | http://autobuild.buildroot.net/results/78340ee174029d7a24b5078751b5b53a3547e10e/
> dnssd.c:64:21: error: dns_sd.h: No such file or directory

Same issue: 
http://lists.busybox.net/pipermail/buildroot/2014-August/105120.html

No solution provided yet.
