From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Oct 2018 09:38:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/ghostscript: fix removal of
 included lcms2
In-Reply-To: <20181001163419.17125-1-bernd.kuhls@t-online.de> (Bernd Kuhls's
 message of "Mon, 1 Oct 2018 18:34:19 +0200")
References: <20181001163419.17125-1-bernd.kuhls@t-online.de>
Message-ID: <877eizzdhb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Ghostscript 9.24 changed the internal lcms2 version:
 > https://www.ghostscript.com/doc/9.24/News.htm

 > With this change the directory name was also changed which broke our
 > code to force the usage of the buildroot lcms2 package.

 > Fixes
 > http://autobuild.buildroot.net/results/d04/d04ad017bf06a442a7397f935959994ba72824e1/

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Committed, thanks.

-- 
Bye, Peter Korsgaard
