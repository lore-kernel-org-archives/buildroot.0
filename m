From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 12 Feb 2016 19:29:24 +0100
Subject: [Buildroot] Analysis of build failures
References: <20160212073018.E5E46101657@stock.ovh.net>
 <20160212104541.0e3774b1@free-electrons.com>
Message-ID: <4tk1pcx7a1.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 12 Feb 2016 10:45:41 +0100 schrieb Thomas Petazzoni:

>>      powerpc |                 numactl-2.0.11 | NOK |
>>      http://autobuild.buildroot.net/
results/2b62e30bcb36c3877686b1471642273e21756c91/
> 
> This seems to be a regression following the merge of patch
> https://git.busybox.net/buildroot/commit/?
id=21ed7a92fe5a771911ef06f97522e504d0eebbc2
> from Bernd.
> 
> Bernd, can you have a look ?

Hi Thomas,

should be fixed by: http://patchwork.ozlabs.org/patch/582268/

Regards, Bernd
