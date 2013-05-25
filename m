From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 25 May 2013 13:28:43 +0200
Subject: [Buildroot] [PATCH] urg: Add urg-select-h.patch.
In-Reply-To: <CAFbHwiSckZivoEYjZQPsp-oX9_t8hR5cviVkGvwGLvq=xYkPSw@mail.gmail.com>
 (Will Newton's message of "Tue, 21 May 2013 21:33:29 +0100")
References: <CAFbHwiSckZivoEYjZQPsp-oX9_t8hR5cviVkGvwGLvq=xYkPSw@mail.gmail.com>
Message-ID: <877ginguxg.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

 Will> This patch fixes a build failure on AArch64 (and potentially others).
 Will> Make sure sys/select.h is included before using select(2).

Committed, thanks.

-- 
Bye, Peter Korsgaard
