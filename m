From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 May 2015 13:17:47 +0200
Subject: [Buildroot] [PATCH 4/6] php: add PHP_VERSION_MAJOR variable
In-Reply-To: <1431978724-25081-4-git-send-email-bos@je-eigen-domein.nl>
 (Floris Bos's message of "Mon, 18 May 2015 21:52:02 +0200")
References: <1431978724-25081-1-git-send-email-bos@je-eigen-domein.nl>
 <1431978724-25081-4-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <87a8wz4hwk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Floris" == Floris Bos <bos@je-eigen-domein.nl> writes:

 > Add PHP_VERSION_MAJOR variable to php.mk for use by other packages.
 > E.g. to install the Ioncube loader binary, it is necessary to
 > know the PHP major version.

 > Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

Committed, thanks.

-- 
Bye, Peter Korsgaard
