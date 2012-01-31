From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 31 Jan 2012 10:34:24 +0100
Subject: [Buildroot] [PATCH] New package: libical
In-Reply-To: <CAGm1_ktjH8rhsC6r9fguaMqzcgDPtAm6-EOpQBqXHF_mwj3qRw@mail.gmail.com>
 (Yegor Yefremov's message of "Tue, 31 Jan 2012 10:23:49 +0100")
References: <1327676345-8958-1-git-send-email-yegorslists@googlemail.com>
 <201201302343.26186.arnout@mind.be>
 <CAGm1_ktjH8rhsC6r9fguaMqzcgDPtAm6-EOpQBqXHF_mwj3qRw@mail.gmail.com>
Message-ID: <87sjiwjjvj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

Hi,

 >>> +comment "libical requires a toolchain with WCHAR support"
 >>> + ? ? depends on !(BR2_USE_WCHAR)
 >> ?I think the brackets are redundant here.

 Yegor> This is how Peter made this for blue-utils, so I just copied this.

I did? That must have been a mistake, I prefer to get rid of the ().

-- 
Bye, Peter Korsgaard
