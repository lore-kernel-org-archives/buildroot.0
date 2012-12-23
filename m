From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 23 Dec 2012 10:15:55 +0100
Subject: [Buildroot] [PATCH] new package: libpciaccess
In-Reply-To: <1356220309-22847-1-git-send-email-stefan.froberg@petroprogram.com>
 ("Stefan =?utf-8?Q?Fr=C3=B6berg=22's?= message of "Sun, 23 Dec 2012
 01:51:49 +0200")
References: <1356220309-22847-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <87y5gpt9h0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stefan" == Stefan Fr?berg <stefan.froberg@petroprogram.com> writes:

 Stefan> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
 Stefan> ---
 Stefan>  package/Config.in                    |    1 +
 Stefan>  package/libpciaccess/Config.in       |    6 ++++++
 Stefan>  package/libpciaccess/libpciaccess.mk |   12 ++++++++++++
 Stefan>  3 files changed, 19 insertions(+), 0 deletions(-)
 Stefan>  create mode 100644 package/libpciaccess/Config.in
 Stefan>  create mode 100644 package/libpciaccess/libpciaccess.mk

Ehh, we already have package/x11r7/xlib_libpciaccess - Any reason you
cannot use that?

I don't think there's any issue with bumping the version to 0.13.1

-- 
Bye, Peter Korsgaard
