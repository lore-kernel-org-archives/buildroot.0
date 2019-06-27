From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Jun 2019 18:02:24 +0200
Subject: [Buildroot] [PATCH-2019.02.x] package/libglib2: backport
 upstream security fix for CVE-2019-12450
In-Reply-To: <20190625205115.23985-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 25 Jun 2019 22:51:15 +0200")
References: <20190625205115.23985-1-peter@korsgaard.com>
Message-ID: <878stn3tkf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes CVE-2019-12450: file_copy_fallback in gio/gfile.c in GNOME GLib 2.15.0
 > through 2.61.1 does not properly restrict file permissions while a copy
 > operation is in progress.  Instead, default permissions are used.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
