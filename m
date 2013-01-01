From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 01 Jan 2013 15:36:45 +0100
Subject: [Buildroot] [PATCH] package/dvb-apps: fix downloading
In-Reply-To: <1356954095-21337-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Mon, 31 Dec 2012 12:41:35 +0100")
References: <1356954095-21337-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87sj6lrmv6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> As we're using the sources from the Mercurial repository, and Buildroot
 Yann> does support retrieving from a Mercurial repository, there is no need
 Yann> to try (and fail1) getting the archive from the Mercurial built-in
 Yann> tarball mechanism.

 Yann> (Note: I was beaten by this because I had a cached copy locally, left
 Yann> after the previous tvheadend-vampirises-files-from-toher-packages attempt,
 Yann> that I forgot to delete before testing. Ouch...)

Committed, thanks.

-- 
Bye, Peter Korsgaard
