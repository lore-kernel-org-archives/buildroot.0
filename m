From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Nov 2015 10:52:24 +0100
Subject: [Buildroot] [PATCH] package/minidlna: fix static build
In-Reply-To: <1447889466-8504-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Thu, 19 Nov 2015 00:31:06 +0100")
References: <1447889466-8504-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87mvua9uzr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > libvorbix.pc does not exist, it is named vorbis.pc.

libvorbis.pc

> Also, sqlite3 was missing when querying pkg-config.

No autobuilder references?

Committed, thanks.

-- 
Bye, Peter Korsgaard
