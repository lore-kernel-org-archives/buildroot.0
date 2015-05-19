From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 May 2015 22:03:09 +0200
Subject: [Buildroot] [PATCH 6/6] php: fpm: remove sample status page
In-Reply-To: <1431978724-25081-6-git-send-email-bos@je-eigen-domein.nl>
 (Floris Bos's message of "Mon, 18 May 2015 21:52:04 +0200")
References: <1431978724-25081-1-git-send-email-bos@je-eigen-domein.nl>
 <1431978724-25081-6-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <87k2w449oi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Floris" == Floris Bos <bos@je-eigen-domein.nl> writes:

 > php-fpm installs a sample status page to $datadir/fpm/status.html
 > It is not of any use in that directory, so remove it from target.
 > If someone wants to use it, he can copy it to webroot manually.

 > Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

Committed, thanks.

-- 
Bye, Peter Korsgaard
