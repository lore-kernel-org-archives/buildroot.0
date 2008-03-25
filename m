From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 25 Mar 2008 11:10:42 +0100
Subject: [Buildroot] build problems
References: <772424.36220.qm@web58210.mail.re3.yahoo.com>
Message-ID: <071101c88e62$eaf568b0$070514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> Hi All,
> 
> I used buildroot a couple of years ago successfully with a samsung 2410 soc.
> 
> I am now trying to use it for a new project. My problem is I cannot get any build to work.
> 
> Has anyone done a svn update and select a default config and have it build? I want to build an arm system, but first I would like some default config to build. I am using ubuntu feisty and think I have installed all the required tools. The mailing list seems to be quite active, but things seem to be in chaos. Can anyone tell me a starting place that is known to work?
> 
> Thanks, Steve
> 
There is no support for SAMSUNG 2410, which in practice means
that you have to disable building linux/U-boot etc, and only build the root fs.


Best Regards
Ulf Samuelsson
