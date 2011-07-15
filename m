From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 15 Jul 2011 22:10:54 +0200
Subject: [Buildroot] [PATCH] gnutls: update to version 2.10.3
In-Reply-To: <1310627455-2628-1-git-send-email-s.neumann@raumfeld.com> (Sven
 Neumann's message of "Thu, 14 Jul 2011 09:10:55 +0200")
References: <1310627455-2628-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <87pqlb8fu9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <s.neumann@raumfeld.com> writes:

 Sven> There are newer releases available, but this is the last release that
 Sven> uses libgcrypt. Newer versions prefer nettle over gcrypt. But then there
 Sven> are users of gnutls (for example libsoup and glib-networking) that
 Sven> assume that gnutls uses gcrypt as its crypto backend. They won't compile
 Sven> with a version of gnutls that uses nettle.

Committed, thanks.

-- 
Bye, Peter Korsgaard
