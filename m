From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 28 Jul 2016 21:52:28 +0200
Subject: [Buildroot] [PATCH v3] asciidoc: use absolute path for resources
In-Reply-To: <CA+fik51fmFkxqNyD=20Pg7RBmv0ot5eHhPw4-ueHuGwkB=2HaQ@mail.gmail.com>
References: <1469642568-26660-1-git-send-email-matthew.weber@rockwellcollins.com>
 <877fc6yji1.fsf@dell.be.48ers.dk>
 <CANQCQpaa6-Mv9arRxE0ijmzQUVCFga0=jpoPUspQinnXERi7kQ@mail.gmail.com>
 <20160728192937.GB5862@free.fr>
 <CA+fik51fmFkxqNyD=20Pg7RBmv0ot5eHhPw4-ueHuGwkB=2HaQ@mail.gmail.com>
Message-ID: <20160728195228.GE5862@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Brandon, All,

On 2016-07-28 14:44 -0500, Brandon Maier spake thusly:
> The bug crops up when generating the chunked/split-HTML manual. Try the
> "manual" target instead of "manual-html".

Indeed, I could reproduce. Your patch indeed fixes it.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
