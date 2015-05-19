From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 May 2015 21:38:33 +0200
Subject: [Buildroot] [PATCH 1/6] php: delete /usr/lib/php/build instead
	of /usr/lib/php
In-Reply-To: <1431978724-25081-1-git-send-email-bos@je-eigen-domein.nl>
 (Floris Bos's message of "Mon, 18 May 2015 21:51:59 +0200")
References: <1431978724-25081-1-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <871tic5pdy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Floris" == Floris Bos <bos@je-eigen-domein.nl> writes:

 > External PHP modules like the OPcache may live in
 > /usr/lib/php/extensions, so only delete /usr/lib/php/build

 > Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

Committed, thanks.

-- 
Bye, Peter Korsgaard
