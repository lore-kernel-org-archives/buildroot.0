From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 05 Jan 2020 21:53:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.30.1
In-Reply-To: <20200104154626.3368475-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Sat, 4 Jan 2020 16:46:26 +0100")
References: <20200104154626.3368475-1-bernd.kuhls@t-online.de>
Message-ID: <87r20doca6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Release notes: https://sqlite.org/releaselog/3_30_1.html
 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 >  package/sqlite/sqlite.hash | 4 ++--
 >  package/sqlite/sqlite.mk   | 2 +-
 >  2 files changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
 > index e297ce3342..ca7db8758e 100644
 > --- a/package/sqlite/sqlite.hash
 > +++ b/package/sqlite/sqlite.hash
 > @@ -1,6 +1,6 @@
 >  # From https://www.sqlite.org/download.html
 > -sha1 785c0f6f00fe1871cb1dd97893267cb50db03b9b  sqlite-autoconf-3300000.tar.gz
 > +sha1 8383f29d53fa1d4383e4c8eb3e087f2ed940a9e0  sqlite-autoconf-3300000.tar.gz

You forgot to update the filename. Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
