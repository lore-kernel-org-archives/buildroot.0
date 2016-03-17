From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 17 Mar 2016 21:54:47 +0100
Subject: [Buildroot] Bug during Kodi compile with host gcc <4.7,
 question regarding autobuilders
References: <934hrcx7vo.ln2@ID-313208.user.individual.net>
 <56E5E786.1090906@mind.be> <4mfjrcxqge.ln2@ID-313208.user.individual.net>
 <20160314230503.0eab7efe@free-electrons.com>
Message-ID: <n5irrcx7at.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 14 Mar 2016 23:05:03 +0100 schrieb Thomas Petazzoni:

> Why do you want to solve the problem? Adding a dependency on
> BR2_HOST_GCC_AT_LEAST_4_6 is perfectly fine, especially for such a
> modern, complex C++ software like Kodi.

Hi Thomas,

to support as many systems as possible, but for me having support for 
host gcc 4.6 is sufficient so I sent a PR upstream:

https://github.com/xbmc/xbmc/pull/9378

Now I am waiting for the upstream reaction, depending on it I will send a 
patch for buildroot.

Regards, Bernd
