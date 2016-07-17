From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Jul 2016 14:48:42 +0200
Subject: [Buildroot] [PATCH v5 4/8] package/kodi: Add suboption to
 control unrar support
References: <1468260542-7194-1-git-send-email-bernd.kuhls@t-online.de>
 <1468260542-7194-4-git-send-email-bernd.kuhls@t-online.de>
 <20160717143628.3589aa0a@free-electrons.com>
Message-ID: <aebs5dx21u.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sun, 17 Jul 2016 14:36:28 +0200 schrieb Thomas Petazzoni:

>> +	help
>> +	  Enable components with non-compliant licenses.

the help text was copied from
https://github.com/xbmc/xbmc/blob/Jarvis/configure.ac#L419

;)

> "non-compliant" doesn't mean anything. non-compliant with what?

I guess they mean non-compliance with GPLv2 under which Kodi is licensed.

Thanks for committing the series!

Regards, Bernd
