From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Fri, 16 Mar 2012 14:57:40 +0100
Subject: [Buildroot] vsftpd
In-Reply-To: <CALo-6+i_VRjU89=VEWS8A_Bg49eCVwwVeTFsTBVfAMvgXHzhBg@mail.gmail.com>
References: <CALo-6+jE0XhxMv2xO-EtOLjnrwR8DC9DPH5U0zeV6qst_F-WaQ@mail.gmail.com>
 <4F6212F7.3060400@wut.de>
 <CALo-6+jD9RYLokKJGdOV1p1mk=ZFUd+uOY5qnCVuK3jTb9mSOQ@mail.gmail.com>
 <4F621A0E.6060405@wut.de>
 <CALo-6+i_VRjU89=VEWS8A_Bg49eCVwwVeTFsTBVfAMvgXHzhBg@mail.gmail.com>
Message-ID: <4F6346D4.40701@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> We can close this part of the thread and see if we can help Yegor with
> his ARM compilation of vsftpd.

I found the problem. See this post: https://www.lonelycoder.com/redmine/boards/7/topics/531

To link against SSL you need both -lssl and -lcrypto. This info can be also found in output/build/vsftpd-2.3.5/vsf_findlibs.sh

Yegor
