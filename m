From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 26 Apr 2021 18:57:47 +0200
Subject: [Buildroot] [PATCH 1/1] package/samba4: add required python
 deps for AD DC support
References: <20210404165823.954492-1-bernd.kuhls@t-online.de>
 <87zgxljhxy.fsf@dell.be.48ers.dk>
Message-ID: <b18jlhxfh3.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Mon, 26 Apr 2021 15:26:01 +0200 schrieb Peter Korsgaard:

> How can this work? We don't currently have a host-python-dnspython
> package.

Hi Peter,

it could not work because I forgot to send the patch adding host-python-
dnspython:

http://patchwork.ozlabs.org/project/buildroot/patch/
20210426165557.18477-1-bernd.kuhls at t-online.de/

Regards, Bernd
