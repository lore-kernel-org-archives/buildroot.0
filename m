From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 20 Oct 2017 18:23:14 +0200
Subject: [Buildroot] [PATCH 1/1] boost: bump to 1.65.1
References: <20171017204407.27704-1-Adamduskett@outlook.com>
 <1508352524.9366.4.camel@embedded.rocks>
 <1194870383.14285518.1508429896191.JavaMail.zimbra@datacom.ind.br>
 <CAFSsvmqLzKA+gDJVK1SdiSEAmHHuqTJfyQC-f05pi_q40QVBqA@mail.gmail.com>
Message-ID: <igkpbexvci.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 19 Oct 2017 15:49:23 -0400 schrieb Adam Duskett:

>> I can't find the information coroutine2 has been removed from the release notes.
>>
>> Please double check this, we use these package :-)
>>
> If you download the latest boost, and check the libs/coroutine2
> folder, there is no longer a src directory.
> Trying to build with "--without-libraries=coroutine2" results in the error:
> "error: wrong library name 'coroutine2' in the --without-<library> option."
> 
> It seems to have been effectively removed!

Hi,

yes, it was removed as a binary lib and converted into a header-only lib:
https://github.com/boostorg/coroutine2/commit/5b06384117d19b8ce8b52678fe7f62d9f1354155

Regards, Bernd
