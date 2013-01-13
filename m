From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 13 Jan 2013 21:04:00 +0100
Subject: [Buildroot] [PATCH] dvbsnoop: new package dvbsnoop
In-Reply-To: <1358082003-16009-2-git-send-email-c.schoenert@gmail.com>
 (Carsten Schoenert's message of "Sun, 13 Jan 2013 14:00:03 +0100")
References: <1358082003-16009-1-git-send-email-c.schoenert@gmail.com>
 <1358082003-16009-2-git-send-email-c.schoenert@gmail.com>
Message-ID: <8738y4yhn3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carsten" == Carsten Schoenert <c.schoenert@gmail.com> writes:

Hi,

 Carsten> From: Carsten Schoenert <c.schoenert@t-online.de>

 Carsten> dvbsnoop is a DVB/MPEG stream analyzer. It's designed to
 Carsten> debug, dump or view the digital stream info available via

 Carsten>     satellite   -> DVB-S, DVB-S2
 Carsten>     cable       -> DVB-C, DVB-C2
 Carsten>     terrestrial -> DVB-T, DVB-T2


 Carsten> +config BR2_PACKAGE_DVBSNOOP
 Carsten> +	bool "dvbsnoop"

It needs largefile support, so I've added the needed dependency /
comment on BR2_LARGEFILE.


 Carsten> +	  Dvbsnoop itself doesn?t do the tuning on the frontend, this has to be

Please stick to ascii for Config.in, menuconfig doesn't like utf-8.

Committed with those fixes, thanks.

-- 
Bye, Peter Korsgaard
