From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 02 Mar 2019 08:58:38 +0100
Subject: [Buildroot] Python 2.7 end of life on January 1, 2020
References: <20190301195404.1c00356b@windsurf>
Message-ID: <emppkfxt9i.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 01 Mar 2019 19:54:04 +0100 schrieb Thomas Petazzoni:

> If that's our decision, then we should probably discuss the deprecation
> path we want to follow to strongly warn users that they should migrate
> away from Python 2.x.

Hi Thomas,

one package using python2 is kodi. Buildroot currently provides version 
17.6, the current upstream release 18.1 is not packaged yet for buildroot 
but it still depends on python2. 

Upstream plans to move to python3 in their next 19.x release:
https://kodi.wiki/view/
General_information_about_migration_to_Python_3#The_Process

The python3-based version is already available for testing in a feature 
branch on github: https://github.com/xbmc/xbmc/compare/feature_python3
but no release date is known atm.

Regards, Bernd
