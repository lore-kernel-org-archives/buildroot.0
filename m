From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 17 May 2016 18:27:02 +0200
Subject: [Buildroot] Analysis of build results for 2016-05-16
References: <20160517063022.7001A10142D@stock.ovh.net>
 <20160517153611.2a3b4199@free-electrons.com>
Message-ID: <XnsA60BBBB0E47FCID313208userindividu@bernd-kuhls.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[posted and mailed]

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote 
in news:20160517153611.2a3b4199 at free-electrons.com:
 
>>         bfin | mtr-66de3ecbab28b054b868a73... | NOK | 
http://autobuild.buildroot.net/results/e05632e0b160ee995ce46aaf3ceddf46d3658adf/
> 
> Uses fork(), needs a dependency on BR2_USE_MMU.

fixed by http://patchwork.ozlabs.org/patch/623207/

Regards, Bernd
