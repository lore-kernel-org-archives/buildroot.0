From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Sep 2019 15:30:46 +0200
Subject: [Buildroot] [PATCH v2] package/cups-filters: fix build without
 NLS
In-Reply-To: <20190919034717.18806-1-unixmania@gmail.com> (unixmania's message
 of "Thu, 19 Sep 2019 00:47:17 -0300")
References: <20190919034717.18806-1-unixmania@gmail.com>
Message-ID: <87lfu552t5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > texttotext must be linked to libiconv if !BR2_ENABLE_LOCALE so pull a
 > patch applied upstream that adds libiconv discovery via autoconf.

 > With this change, autoreconf requires the config.rpath and ABOUT-NLS
 > files which are not in v1.25.4. Add a pre-configure hook to fake them.

 > Fixes: https://bugs.busybox.net/show_bug.cgi?id=12031

 > Signed-off-by: Carlos Santos <unixmania@gmail.com>

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
