From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 12 Apr 2013 10:05:26 +0200
Subject: [Buildroot] [PATCH] linux: fix 3.8.x stable version
In-Reply-To: <1365753305-5485-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Fri, 12 Apr 2013 08:55:05 +0100")
References: <1365753305-5485-1-git-send-email-spdawson@gmail.com>
Message-ID: <871uagrx6h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>

 spdawson> Commit c461e64201598eae85ff32e130ed3f0ccd9fed78 bumped the
 spdawson> linux 3.8.x stable version from 3.8.5 to 3.8.6, but did so in
 spdawson> only one of the two places in which the version number is
 spdawson> hard-coded in linux/Config.in

Committed, thanks.

-- 
Bye, Peter Korsgaard
