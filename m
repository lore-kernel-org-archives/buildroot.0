From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 30 Nov 2012 11:49:07 -0800
Subject: [Buildroot] [PATCH v5] Add /var/www to device table
In-Reply-To: <1354298185-2974-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Fri, 30 Nov 2012 17:56:25 +0000")
References: <1354298185-2974-1-git-send-email-spdawson@gmail.com>
Message-ID: <8738zqc1n0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> The /var/www directory is listed in /etc/passwd in the skeleton target
 spdawson> filesystem as the home directory of the www-data user (uid 33).

 spdawson> In the final target filesystem, /var/www should be owned by
 spdawson> www-data. This is important for the lighttpd package, for
 spdawson> example.

Committed, thanks.

-- 
Bye, Peter Korsgaard
