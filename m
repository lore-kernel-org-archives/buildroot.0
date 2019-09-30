From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Sep 2019 15:30:33 +0200
Subject: [Buildroot] [PATCH] package/cups-filters: fix broken symlink in
 installation
In-Reply-To: <20190919035121.19223-1-unixmania@gmail.com> (unixmania's message
 of "Thu, 19 Sep 2019 00:51:21 -0300")
References: <20190919035121.19223-1-unixmania@gmail.com>
Message-ID: <87pnjh52ti.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "unixmania" == unixmania  <unixmania@gmail.com> writes:

 > From: Carlos Santos <unixmania@gmail.com>
 > The patch used previously to support versions of ln lacking the '-r'
 > option generated broken links:

 >     $ file target/usr/lib/cups/backend/driverless
 >     target/usr/lib/cups/backend/driverless: broken symbolic link to ../../usr/lib/cups/driver/driverless

 > Add a squashing of two patches already sent upstream that provide a
 > better solution:

 >     https://github.com/OpenPrinting/cups-filters/pull/154
 >     https://github.com/OpenPrinting/cups-filters/pull/157

 > Signed-off-by: Carlos Santos <unixmania@gmail.com>

Committed to 2019.02.x, 2019.05.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
