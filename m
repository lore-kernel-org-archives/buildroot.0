From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 Jan 2020 13:16:04 +0100
Subject: [Buildroot] [PATCH] package/libsigrokdecode: bump to v0.5.3
In-Reply-To: <20200106100108.15415-1-brgl@bgdev.pl> (Bartosz Golaszewski's
 message of "Mon, 6 Jan 2020 11:01:08 +0100")
References: <20200106100108.15415-1-brgl@bgdev.pl>
Message-ID: <87d0bwlr0b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bartosz" == Bartosz Golaszewski <brgl@bgdev.pl> writes:

 > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
 > Remove the patch that's now upstream.

 > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Committed after dropping _AUTORECONF = YES now that we are no longer
patching configure.ac, thanks.

-- 
Bye, Peter Korsgaard
