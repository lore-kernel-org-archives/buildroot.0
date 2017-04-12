From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 21:20:33 +0200
Subject: [Buildroot] [PATCH 0/2] update axs10x defconfigs
In-Reply-To: <1491921774-14748-1-git-send-email-vzakhar@synopsys.com>
References: <1491921774-14748-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20170412212033.7c1576ec@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 11 Apr 2017 17:42:52 +0300, Vlad Zakharov wrote:

>   config: update linux and u-boot in axs10x defconfigs
>   arc: u-boot: Support slave core kick-start on axs103 v1.1

I've applied both patches, after tweaking the commit title and commit
logs.

For the commit title, could you in the future use:

  configs/<name of defconfig>: <what you're doing>

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
