From: Charles Krinke <charles.krinke@gmail.com>
Date: Thu, 15 Mar 2012 10:04:45 -0700
Subject: [Buildroot] vsftpd
In-Reply-To: <4F621A0E.6060405@wut.de>
References: <CALo-6+jE0XhxMv2xO-EtOLjnrwR8DC9DPH5U0zeV6qst_F-WaQ@mail.gmail.com>
 <4F6212F7.3060400@wut.de>
 <CALo-6+jD9RYLokKJGdOV1p1mk=ZFUd+uOY5qnCVuK3jTb9mSOQ@mail.gmail.com>
 <4F621A0E.6060405@wut.de>
Message-ID: <CALo-6+i_VRjU89=VEWS8A_Bg49eCVwwVeTFsTBVfAMvgXHzhBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you kindly, Markus. I now have vsftpd accepting connections and
navigating directories on my MPC8321 target using buildroot. The key
was the config files that were missing. Once they had appropriate
entries as you described, everything works.

A "ps" shows vsftpd. A "netstate" shows ftp as a consequence of the
"listen=YES" statement. The rest was user configuration as described.

We can close this part of the thread and see if we can help Yegor with
his ARM compilation of vsftpd.

Charles "Noob for the Day" Krinke

p.s. Microperl next. But I will start a new thread.
