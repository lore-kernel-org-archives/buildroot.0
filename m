From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jan 2021 22:26:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-zattoo: fix json
 dependency
In-Reply-To: <20210115181529.611511-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Fri, 15 Jan 2021 19:15:29 +0100")
References: <20210115181529.611511-1-bernd.kuhls@t-online.de>
Message-ID: <87k0sadjiv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Package depends on rapidjson, not rapidxml:
 > https://github.com/rbuehlma/pvr.zattoo/blob/Leia/CMakeLists.txt#L10

 > The bug was previously not noticed because kodi depends on rapidjson
 > https://github.com/xbmc/xbmc/blob/Leia/CMakeLists.txt#L133
 > and kodi-platform depends on kodi
 > https://github.com/xbmc/kodi-platform/blob/master/CMakeLists.txt#L8

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed to 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
