From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 30 Aug 2017 22:18:57 +0200
Subject: [Buildroot] [PATCH 4/6] package/libconfig: switch to github
References: <20170829191005.19697-1-bernd.kuhls@t-online.de>
 <20170829191005.19697-4-bernd.kuhls@t-online.de>
 <20170829214649.0c3bf1b4@windsurf.lan>
Message-ID: <h6jj7ex73j.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 29 Aug 2017 21:46:49 +0200 schrieb Thomas Petazzoni:

> Are there some important source code changes between those two versions
> labeled 1.5 ?

Hi Thomas,

the two tarballs do not have the same content, I failed to find a github 
hash which is equivalent to the previous tarball so I marked my patch as 
rejected. Today I tried to build 1.6 but it failed, even after adding 
https://github.com/hyperrealm/libconfig/pull/75, so we should keep things 
the way they are atm.

Regards, Bernd
