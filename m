From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 04 Feb 2018 13:01:58 +0100
Subject: [Buildroot] [PATCH 1/1] package/kodi-visualisation-goom: fix
 broken hash
References: <20180203223150.27467-1-bernd.kuhls@t-online.de>
 <87d11lyszv.fsf@dell.be.48ers.dk>
Message-ID: <ma9jkex9qo.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 04 Feb 2018 11:00:20 +0100 schrieb Peter Korsgaard:

>>>>>> "Bernd" == Bernd Kuhls
>>>>>> <bernd.kuhls@t-online.de> writes:
> 
>  > Comparing both tarballs, the one from github.com and the one stored
>  > at sources.buildroot.net, using diff showed no differences.
> 
>  > Signed-off-by: Bernd Kuhls
>  > <bernd.kuhls@t-online.de>
> 
> We cannot really do this was it would break all releases since this hash
> was added (2017.05). Perhaps you can bump the version instead?

Hi Peter,

sorry, this is not possible. The upstream repo does not have branches 
related to various Kodi versions, only a master branch and some older 
feature branches.

The commit from master branch used in buildroot is the last one 
compatible with Kodi 17.x-Krypton, later commits introduced changes for 
upcoming Kodi 18.x-Leia.

Regards, Bernd
