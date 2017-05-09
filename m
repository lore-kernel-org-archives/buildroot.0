From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 09 May 2017 07:24:51 +0200
Subject: [Buildroot] Analysis of build results for 2017-05-07
References: <20170508062835.044A8207F0@mail.free-electrons.com>
 <20170508224233.7332472b@free-electrons.com>
Message-ID: <3e08udxddn.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 08 May 2017 22:42:33 +0200 schrieb Thomas Petazzoni:

>>         m68k |                     ffmpeg-3.3 | NOK |
>>         http://autobuild.buildroot.net/results/
dc5a042952c3f1f6a6fa06db0e7ac70f701c50dc
>>         |
> 
> undefined reference to `__sync_fetch_and_add_4'
> 
> We should add the appropriate BR2_TOOLCHAIN_* dependency.

Hi Thomas,

corresponding patches were discussed in the last weeks:

http://patchwork.ozlabs.org/patch/756664/
http://patchwork.ozlabs.org/patch/751131/

Regards, Bernd
