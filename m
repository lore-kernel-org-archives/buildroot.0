From: Michael Nosthoff <buildroot@heine.tech>
Date: Tue, 03 Nov 2020 09:51:05 +0100
Subject: [Buildroot] 
 =?utf-8?q?=5Bautobuild=2Ebuildroot=2Enet=5D_Your_dai?=
 =?utf-8?q?ly_results_for_2020-11-02?=
Message-ID: <49-5fa11a00-1-271de3c0@117826441>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

from time to time I get this build failure reported:

On Tuesday, November 03, 2020 09:10 CET, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote: 
> 
> Results for the '2020.02.x' branch
> ----------------------------------
> 
> Build failures related to your packages:
> 
>     arch     |             reason             |                                       url                                      
> -------------+--------------------------------+---------------------------------------------------------------------------------
>     or1k     |        host-grpc-1.25.0        | http://autobuild.buildroot.net/results/605a7e9911fac8785272d0ffdabdde9c8876daa5
> 

this was fixed by this commit:

https://patchwork.ozlabs.org/project/buildroot/patch/20200915161107.1826-1-buildroot at heine.tech/ 

Would it make sense to pick this for LTS?
It fixes a corner-case with the autobuilder which uses gcc 4.8 on ubuntu, so I wouldn't say it's absolutely needed though. 

Regards,
Michael
