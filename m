From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 14 Jan 2014 23:01:10 +0100
Subject: [Buildroot] [PATCH] package: libpng: don't append prefix to
	symbol names in the version script file
In-Reply-To: <1388399753-11513-1-git-send-email-Sonic.adi@gmail.com> (sonic
 adi's message of "Mon, 30 Dec 2013 18:35:53 +0800")
References: <1388399753-11513-1-git-send-email-Sonic.adi@gmail.com>
Message-ID: <87ppnuw7dl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "sonic" == sonic adi <sonic.adi@gmail.com> writes:

 > From: Sonic Zhang <sonic.zhang@analog.com>
 > Even if Blackfin GNU toolchain add prefix '_' to all symbols,
 > symbol prefix is not accepted in the link flag --version-script.
 > Don't append prefix in the symbols in the version script file.

 > Signed-off-by: Sonic Zhang <sonic.zhang@analog.com>
 > ---
 >  .../libpng/libpng-02-ingore-symbol-prefix.patch    |   26 ++++++++++++++++++++
 >  1 file changed, 26 insertions(+)
 >  create mode 100644 package/libpng/libpng-02-ingore-symbol-prefix.patch

 > diff --git a/package/libpng/libpng-02-ingore-symbol-prefix.patch b/package/libpng/libpng-02-ingore-symbol-prefix.patch
 > new file mode 100644
 > index 0000000..7f2cfff
 > --- /dev/null
 > +++ b/package/libpng/libpng-02-ingore-symbol-prefix.patch

Committed with the filename typo fixed, thanks.

-- 
Bye, Peter Korsgaard
