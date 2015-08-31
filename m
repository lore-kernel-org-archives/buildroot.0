From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 31 Aug 2015 16:44:25 +0200
Subject: [Buildroot] [PATCH v3 1/2] libssh: new package
References: <1441025945-4689-1-git-send-email-fancp2007@gmail.com>
 <1441025945-4689-2-git-send-email-fancp2007@gmail.com>
 <jg5ebcxrsk.ln2@ID-313208.user.individual.net>
Message-ID: <9r5ebcxrsk.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 31 Aug 2015 16:38:43 +0200 schrieb Bernd Kuhls:

> Am Mon, 31 Aug 2015 20:59:04 +0800 schrieb Scott Fan:
> 
>> libssh2 and libssh both implement SSH and provide a library API for
>> apps.
>> Both support SSH, SFTP, auth, channels etc. Both are 25K-30K lines of
>> code.
> 
> Tested-by: Bernd Kuhls
> <bernd.kuhls@t-online.de>
> (only compile tested and linked with Kodi using this
>  patch: http://patchwork.ozlabs.org/patch/512504/)

Correction: I used this patch for Kodi support:
http://patchwork.ozlabs.org/patch/512505/
