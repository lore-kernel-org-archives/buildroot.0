From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Dec 2015 19:05:23 +0100
Subject: [Buildroot] RFC: Patch series for Kodi 16-Jarvis
Message-ID: <3sigkcxlsq.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

here you will find my current snapshot for the next Kodi release:
https://github.com/bkuhls/buildroot/tree/kodi16

Current release status is beta4:
http://kodi.tv/kodi-16-0-beta-4-jarvis-is-getting-ready-4/

My tree uses HEAD of the Jarvis branch:
https://github.com/xbmc/xbmc/tree/Jarvis

The first two patches in my series do not depend on the Kodi version 
bump, I am using them with 15.2 already, therefore they precede the Kodi 
version bump:
http://patchwork.ozlabs.org/patch/538512/
http://patchwork.ozlabs.org/patch/538513/

Kodi moved to C++11 so we need gcc >= 4.7:
https://github.com/xbmc/xbmc/pull/6412

I know that hash files are missing, I will add them to the patch series 
of the final bump after the release of Kodi 16.0-Jarvis.

Feedback welcome ;)

Regards, Bernd
