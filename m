From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Nov 2018 08:48:23 +0100
Subject: [Buildroot] [PATCH 1/1] busybox: add patch to fix seg fault in
 'ifup -a'
In-Reply-To: <1542585919.3880044.1581250240.4A44208F@webmail.messagingengine.com>
 (Daniel Mentz's message of "Sun, 18 Nov 2018 16:05:19 -0800")
References: <20181110193319.1273-1-daniel.m@sent.com>
 <1989059802.1429665.1541889047561.JavaMail.zimbra@datacom.com.br>
 <CA+1k=2b2EPjS_JBF__mVhgaLcJc22P=nCp-BSzo2hdLPwzp0Eg@mail.gmail.com>
 <87d0r4stxe.fsf@dell.be.48ers.dk>
 <1542585919.3880044.1581250240.4A44208F@webmail.messagingengine.com>
Message-ID: <87pnv1ld88.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel Mentz <daniel.m@sent.com> writes:

 > On Fri, Nov 16, 2018, at 11:29 AM, Peter Korsgaard wrote:
 >> 2018.08.x still had 1.29.2, so I've bumped that to 1.29.3.

 > You said you bumped busybox on 2018.08.x to 1.29.3? I just ran "git
 > fetch", but I can't see the change in origin/2018.08.x

Ups, it never got pushed. It is there now:

https://git.buildroot.net/buildroot/commit/?h=2018.08.x&id=1eaf77e729a57b176c1a25bb2855f4974b6ab9b0

-- 
Bye, Peter Korsgaard
