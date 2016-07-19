From: Roland Franke <fli4l@franke-prem.de>
Date: Tue, 19 Jul 2016 10:06:06 +0200
Subject: [Buildroot] [PATCH 1/1] rrdtool: bump version to 1.6.0
In-Reply-To: <20160718230747.5c95117e@free-electrons.com>
References: <1462824635-15327-1-git-send-email-fli4l@franke-prem.de><7784C342613B494384D01500F96DF13D@ROLANDAMD64>
 <20160718230747.5c95117e@free-electrons.com>
Message-ID: <F5AC2770B8C44FEA82C97608417562E9@ROLANDAMD64>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

> On Mon, 18 Jul 2016 14:12:22 +0200, Roland Franke wrote:
>> As the second version of this patch with deleted function
>> RRDTOOL_AUTORECONF = YES
>> RRDTOOL_GETTEXTIZE = YES
>> 
>> will not work in all situations, my question is if this first version
>> can be used for the update of RRDTool to version 1.6.0

> I've applied your patch, after doing some fixes:

>     [Thomas:
>      - add dependency on gettext when needed
>      - add comment about why autoreconf/gettextize are kept
>      - cleanup commit log.]

As i have made an mistake by me local, my checkout is complete
down and i will not be able to come back to an point for bring 
up an clean patch in the system (Sorry).
So anyone feel free to do that instead of me.

Best regards,
Roland 
