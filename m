From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Aug 2016 13:09:03 +0200
Subject: [Buildroot] [PATCH 1/2] i2c-tools: add busybox to dependencies
In-Reply-To: <1470133656-13954-1-git-send-email-bgolaszewski@baylibre.com>
 (Bartosz Golaszewski's message of "Tue, 2 Aug 2016 12:27:35 +0200")
References: <1470133656-13954-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <87eg67mnqo.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bartosz" == Bartosz Golaszewski <bgolaszewski@baylibre.com> writes:

 > Before changing the install directory of i2c-tools to /usr/sbin/ make
 > sure busybox is built first (if selected) in order to ensure that the
 > symlinks to the busybox-provided versions are overwritten by the
 > i2c-tools' install commands.

 > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
