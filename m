From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 25 Oct 2020 16:02:39 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi: bump version to 18.9-Leia
References: <20201025114959.561657-1-bernd.kuhls@t-online.de>
 <20201025155338.15e629dc@windsurf.home>
Message-ID: <flgg6hx1lq.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 25 Oct 2020 15:53:38 +0100 schrieb Thomas Petazzoni:

>>  package/kodi-jsonschemabuilder/kodi-jsonschemabuilder.mk | 2 +-
>>  package/kodi-texturepacker/kodi-texturepacker.mk         | 2 +-
> 
> You are changing the version of those packages, without updating their
> hash files. This doesn't seem right.

Hi Thomas,

both .hash files are links to ../kodi/kodi.hash

Regards, Bernd
