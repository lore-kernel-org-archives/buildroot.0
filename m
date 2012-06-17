From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 17 Jun 2012 19:47:12 +0200
Subject: [Buildroot] [PATCH] jquery: allow custom install location
In-Reply-To: <1339681388-13133-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Thu, 14 Jun 2012 14:43:08 +0100")
References: <1339681388-13133-1-git-send-email-spdawson@gmail.com>
Message-ID: <87bokhg7a7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>

 spdawson> Allow the JavaScript install path to be customised. By
 spdawson> default, JavaScript files are installed to /var/www under the
 spdawson> target root directory.

What's the use case for this? If we need it, wouldn't it then make more
sense to have a BR-wide setting for this instead of for each webrelated
package?

-- 
Bye, Peter Korsgaard
