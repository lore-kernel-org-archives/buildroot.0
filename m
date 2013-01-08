From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Tue, 08 Jan 2013 20:17:06 +0200
Subject: [Buildroot] [PATCH] new package: proxychains
In-Reply-To: <20130108180957.30c9f629@skate>
References: <1356222029-6290-1-git-send-email-stefan.froberg@petroprogram.com>
 <20130108180957.30c9f629@skate>
Message-ID: <50EC62A2.8020505@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas

8.1.2013 19:09, Thomas Petazzoni kirjoitti:
> Dear Stefan Fr?berg,
>
> On Sun, 23 Dec 2012 02:20:29 +0200, Stefan Fr?berg wrote:
>> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
>> ---
>>  package/Config.in                  |    1 +
>>  package/proxychains/Config.in      |    7 +++++++
>>  package/proxychains/proxychains.mk |   10 ++++++++++
>>  3 files changed, 18 insertions(+), 0 deletions(-)
>>  create mode 100644 package/proxychains/Config.in
>>  create mode 100644 package/proxychains/proxychains.mk
> This new package generates the following build failure:
>
>   http://autobuild.buildroot.org/results/7364b557c1fea642a3631c4735dd93f02ba70dd5/build-end.log
>
> Can you try to investigate and see if you can provide a patch to fix it?
>
> Thanks!
>
> Thomas

Well, I can try to make a patch to that  libproxychains.c:291:5: error:
conflicting types for 'getnameinfo'  error but I can't test it in arm
because I don't
have any real arm machine here and my poor hard drive is already so
stuffed that building arm qemu-image would be difficult
 :-(

But I will take a look of this

Stefan
