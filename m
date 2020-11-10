From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2020 10:37:35 +0100
Subject: [Buildroot] [PATCH] package/python-pillow: bump to version 8.0.1
In-Reply-To: <20201108154148.940813-1-angelo@amarulasolutions.com> (Angelo
 Compagnucci's message of "Sun, 8 Nov 2020 16:41:48 +0100")
References: <20201108154148.940813-1-angelo@amarulasolutions.com>
Message-ID: <871rh1pn6o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

 > From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
 > Bumping the package requires two fixes:
 > * pillow looks for header files in paths returned by pkg-config.
 >   On buildroot, pkg-config returns nothing if PKG_CONFIG_ALLOW_SYSTEM_CFLAGS
 >   is disabled.
 > * png is the default pillow image format and png format is working only
 >   if python zlib module is available.

 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
