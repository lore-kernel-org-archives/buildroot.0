From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 27 Jan 2015 16:12:49 +0100
Subject: [Buildroot] [PATCH 1/5] package/giflib: New package
In-Reply-To: <1422300260-5361-1-git-send-email-bernd.kuhls@t-online.de> (Bernd
 Kuhls's message of "Mon, 26 Jan 2015 20:24:16 +0100")
References: <1422300260-5361-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87egqgz28e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > This package will replace libungif.
 > Needed for Kodi 15.0, TexturePacker depends on giflib >= 5.0.5
 > https://github.com/xbmc/xbmc/blob/master/tools/depends/native/TexturePacker/src/configure.ac#L29

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

I did a quick test and they are basically equivalent in file size:

find output/staging/usr/lib/lib*gif.so* -type f | xargs ls -lah
-rwxr-xr-x 1 peko peko 31K Jan 27 16:04 output/staging/usr/lib/libgif.so.7.0.0
-rwxr-xr-x 1 peko peko 32K Jan 27 16:08 output/staging/usr/lib/libungif.so.4.1.4

-- 
Bye, Peter Korsgaard
