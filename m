From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Feb 2016 17:55:33 +0100
Subject: [Buildroot] [PATCH v3 1/1] package/libgsm: new package
References: <1430072810-27772-1-git-send-email-bernd.kuhls@t-online.de>
 <20160111224046.GE4257@free.fr>
Message-ID: <5p6ppcx8q1.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 11 Jan 2016 23:40:46 +0100 schrieb Yann E. MORIN:

> So I've added that patch to my series adding asterisk, and I've reworked
> it a bit.

Hi Yann,

FYI, I just saw that mediastreamer has an optional dependency to libgsm, 
to control it mediastreamer's build system supports --enable-gsm/
--disable-gsm. If you enable gsm support you need to add
--with-gsm=$(STAGING_DIR)/usr, otherwise mediastreamer will look in /usr.

Regards, Bernd
