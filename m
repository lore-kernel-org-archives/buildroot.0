From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 18 Mar 2013 11:39:51 +0100
Subject: [Buildroot] [PATCH] zeromq: require IPv6 support in toolchain
In-Reply-To: <1363599725-23511-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Mon, 18 Mar 2013 09:42:05 +0000")
References: <1363599725-23511-1-git-send-email-spdawson@gmail.com>
Message-ID: <87a9q10z60.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>

 spdawson> The zeromq package was recently bumped from version 2.2.0 to
 spdawson> version 3.2.2, which has introduced a requirement for IPv6
 spdawson> support in the toolchain. At present, IPv6 support is
 spdawson> mandatory in zeromq: there is no configuration option to
 spdawson> enable/disable the feature.

Committed, thanks.

-- 
Bye, Peter Korsgaard
