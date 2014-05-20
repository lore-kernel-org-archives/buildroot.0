From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Tue, 20 May 2014 22:49:58 +0200
Subject: [Buildroot] [PATCH WIP 16/16] xbmc: Add xbmc-send script to
	send commands to xbmc service
References: <1396296389-28821-1-git-send-email-bernd.kuhls@t-online.de>
 <1396296389-28821-17-git-send-email-bernd.kuhls@t-online.de>
 <20140331222008.GE5004@free.fr>
Message-ID: <mors4bx8ub.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
news:20140331222008.GE5004 at free.fr: 

>> +define XBMC_INSTALL_XBMC_SEND
>> +     $(INSTALL) -D $(@D)/tools/EventClients/lib/python/xbmcclient.py
>> $(TARGET_DIR)/usr/lib/python2.7/xbmcclient.py 
> 
> If possible, please install both a .py and a .pyc to the target.

Hi,

I did not forget this patch, but reworking it is currently postponed.

Regards, Bernd
