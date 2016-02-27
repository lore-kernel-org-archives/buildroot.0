From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2016 23:18:27 +0100
Subject: [Buildroot] [PATCH] support/download: really,
	really make git archives reproducible
In-Reply-To: <1456610595-8715-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sat, 27 Feb 2016 23:03:15 +0100")
References: <1456610595-8715-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87mvqlre4s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The way we use it, gzip will store the current time in the header, which
 > leads to unreproducible archives.

 > Fiss that by telling gzip to not store the name and date of the file it
 > compresses, with the -n option. Since it compresses its stdin, there was
 > already no filename stored; now there's even no date stored.

 > Note: gzip has had -n since at least 1.2.4, released in 1993, so
 > virtually every gzip out there nowadays has it.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
