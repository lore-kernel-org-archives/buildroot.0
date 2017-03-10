From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 10 Mar 2017 07:05:52 +0100
Subject: [Buildroot] [PATCH 1/2] package/cwiid: bump version
References: <20170219131834.27844-1-bernd.kuhls@t-online.de>
 <20170309223551.6vwvvcd6novs7nc7@piout.net>
Message-ID: <0bs9pdx47e.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 09 Mar 2017 23:35:51 +0100 schrieb Alexandre Belloni:

> Because then, the wiimote is mapped to proper inputdev events, I'm not
> sure any driver is actually necessary to control kodi (supposition only,
> I don't use kodi).

Hi,

Kodi really uses cwiid:
https://github.com/xbmc/xbmc/blob/Krypton/project/cmake/modules/
FindCWiid.cmake

Regards, Bernd
