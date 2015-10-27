From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Oct 2015 21:38:43 +0100
Subject: [Buildroot] [PATCH v3] rfkill: new package
In-Reply-To: <562FAE13.8070507@inbox.ru> (Viacheslav Volkov's message of "Tue, 
 27 Oct 2015 20:02:11 +0300")
References: <1445957711-10417-1-git-send-email-sv99@inbox.ru>
 <20151027152544.GB3555@free.fr> <562FAE13.8070507@inbox.ru>
Message-ID: <878u6o9hd8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Viacheslav" == Viacheslav Volkov <sv99@inbox.ru> writes:

 > Exists questions with license information.
 > In the distributions exists file COPYING:

 > Copyright 2009 Johannes Berg <johannes@sipsolutions.net>
 > Copyright 2009 Marcel Holtmann <marcel@holtmann.org>
 > Copyright 2009 Tim Gardner <tim.gardner@canonical.com>

 > Permission to use, copy, modify, and/or distribute this software for any
 > purpose with or without fee is hereby granted, provided that the above
 > copyright notice and this permission notice appear in all copies.

 > THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 > WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 > MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 > ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 > WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 > ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 > OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

That is the ISC license:

https://opensource.org/licenses/ISC

So:

RFKILL_LICENSE = ISC
RFKILL_LICENSE_FILES = COPYING

-- 
Bye, Peter Korsgaard
