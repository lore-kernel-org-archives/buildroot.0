From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 06 Jan 2021 07:30:27 +0100
Subject: [Buildroot] [PATCH 1/1] package/python3: add optional support
 for lib2to3
References: <20210103150306.1509091-1-bernd.kuhls@t-online.de>
 <87h7nv3t9k.fsf@dell.be.48ers.dk>
Message-ID: <312gchxtjh.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 05 Jan 2021 23:37:11 +0100 schrieb Peter Korsgaard:

> Above you mention kodi 18, but here kodi 19? Is this only needed for
> Kodi 19 or should it also be backported to 2020.02.x / 2020.11.x?

Hi Peter,

backporting this patch is not necessary as kodi19 (which depends on 
python3) will imho never be backported to older buildroot versions.

For kodi18 (which depends on python2) a similar patch was already 
committed: https://git.buildroot.net/buildroot/commit/package/python?
id=480e926db42b8df6d55de5c08a470a501910f6a8

Regards, Bernd
