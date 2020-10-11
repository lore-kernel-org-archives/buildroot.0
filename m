From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Oct 2020 17:54:25 +0200
Subject: [Buildroot] [PATCH 1/2] package/postgresql: add configure and
 includedir-server output to pg_config
In-Reply-To: <20201005101951.3112095-2-fido_max@inbox.ru> (Maxim Kochetkov's
 message of "Mon, 5 Oct 2020 13:19:50 +0300")
References: <20201005101951.3112095-1-fido_max@inbox.ru>
 <20201005101951.3112095-2-fido_max@inbox.ru>
Message-ID: <87lfgcwyfi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxim" == Maxim Kochetkov <fido_max@inbox.ru> writes:

 > Some external packages call pg_config to determine the installed PostgreSQL
 > version. Add this output to Buildroots own pg_config, so these packages
 > correctly compile.

 > Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
