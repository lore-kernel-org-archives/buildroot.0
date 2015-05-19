From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 May 2015 21:41:43 +0200
Subject: [Buildroot] [PATCH 3/6] php: enable opcache extension in
	php.ini if selected
In-Reply-To: <1431978724-25081-3-git-send-email-bos@je-eigen-domein.nl>
 (Floris Bos's message of "Mon, 18 May 2015 21:52:01 +0200")
References: <1431978724-25081-1-git-send-email-bos@je-eigen-domein.nl>
 <1431978724-25081-3-git-send-email-bos@je-eigen-domein.nl>
Message-ID: <87sias4ao8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Floris" == Floris Bos <bos@je-eigen-domein.nl> writes:

 > Add a line to load the opcache extension in php.ini, at the
 > bottom of the "dynamic extensions" section.

 > Signed-off-by: Floris Bos <bos@je-eigen-domein.nl>

Committed, thanks.

-- 
Bye, Peter Korsgaard
