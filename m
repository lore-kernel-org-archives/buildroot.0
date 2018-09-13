From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 13 Sep 2018 08:16:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/libssh2: bump version
References: <20180911205613.24701-1-bernd.kuhls@t-online.de>
 <20180912163344.532b37ab@windsurf>
Message-ID: <bubp6fxp95.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 12 Sep 2018 16:33:44 +0200 schrieb Thomas Petazzoni:

> Hello,
> 
> On Tue, 11 Sep 2018 22:56:13 +0200, Bernd Kuhls wrote:
> 
>> -LIBSSH2_VERSION = 616fd4d1b3e4a55de67c48819fefca83132126b5
>> +LIBSSH2_VERSION = 8b870ad771cbd9cd29edbb3dbb0878e950f868ab
> 
> Looks like this new version has issues:
> 
>   http://autobuild.buildroot.net/?
reason=libssh2-8b870ad771cbd9cd29edbb3dbb0878e950f868ab
> 
> Thomas

Hi Thomas,

tried both defconfigs from Sep, 12th, both build without issues. I can 
not reproduce the problem here (Debian buster), sorry.

Regards, Bernd
