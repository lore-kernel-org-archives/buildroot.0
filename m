From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 13 Feb 2016 20:08:40 +0100
Subject: [Buildroot] [PATCH 1/1] package/lvm2: fix musl build
References: <1453847201-19076-1-git-send-email-bernd.kuhls@t-online.de>
 <56B0C539.1000200@gmail.com>
Message-ID: <oib4pcxqnk.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Tue, 02 Feb 2016 16:03:21 +0100 schrieb Romain Naour:

>> ++#else ++#define _reopen_stream(stream, fd, mode, name) (freopen(NULL,
>> mode, stream) != NULL)
>> ++#endif
> 
> I'm just wondering why not use freopen() directly and remove
> __reopen_stream() ?

Hi Romain,

a similar question last year on the lvm2 mailinglist remained unanswered, 
I just sent a reminder, along with our patch:
http://article.gmane.org/gmane.linux.lvm.devel/15110

Regards, Bernd
