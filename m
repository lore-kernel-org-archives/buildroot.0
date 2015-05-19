From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 May 2015 21:40:35 +0200
Subject: [Buildroot] [PATCH 2/6] php: patch acinclude.m4 instead of
	aclocal.m4
In-Reply-To: <1431978724-25081-2-git-send-email-bos@je-eigen-domein.nl>
 (Floris Bos's message of "Mon, 18 May 2015 21:52:00 +0200")
References: <1431978724-25081-1-git-send-email-bos@je-eigen-domein.nl>
 <1431978724-25081-2-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <87wq044aq4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Floris" == Floris Bos <bos@je-eigen-domein.nl> writes:

 > aclocal.m4 gets regenerated from acinclude.m4, so patch the last.
 > Fixes "Extensions are not supported on this platform" error when
 > loading any external (zend) extension in php.ini.
 > Was caused by 0001-ditch-unset.patch not being applied to the
 > correct file, and our ac_cv_func_dlopen=yes env setting being unset.

 > Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

Committed, thanks.

-- 
Bye, Peter Korsgaard
