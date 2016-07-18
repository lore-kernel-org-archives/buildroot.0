From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jul 2016 23:07:47 +0200
Subject: [Buildroot] [PATCH 1/1] rrdtool: bump version to 1.6.0
In-Reply-To: <7784C342613B494384D01500F96DF13D@ROLANDAMD64>
References: <1462824635-15327-1-git-send-email-fli4l@franke-prem.de>
 <7784C342613B494384D01500F96DF13D@ROLANDAMD64>
Message-ID: <20160718230747.5c95117e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Jul 2016 14:12:22 +0200, Roland Franke wrote:
> As the second version of this patch with deleted function
> RRDTOOL_AUTORECONF = YES
> RRDTOOL_GETTEXTIZE = YES
> 
> will not work in all situations, my question is if this first version
> can be used for the update of RRDTool to version 1.6.0
> 
> Best regards,
> Roland

I've applied your patch, after doing some fixes:

    [Thomas:
     - add dependency on gettext when needed
     - add comment about why autoreconf/gettextize are kept
     - cleanup commit log.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
