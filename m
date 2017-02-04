From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 04 Feb 2017 09:18:06 +0100
Subject: [Buildroot] [PATCH v2] package/libgpiod: bump version to v0.1.2
In-Reply-To: <1486055331-1615-1-git-send-email-bgolaszewski@baylibre.com>
 (Bartosz Golaszewski's message of "Thu, 2 Feb 2017 18:08:51 +0100")
References: <1486055331-1615-1-git-send-email-bgolaszewski@baylibre.com>
Message-ID: <8760kq1i9t.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bartosz" == Bartosz Golaszewski <bgolaszewski@baylibre.com> writes:

 > This is a small bug-fix release:
 >   - include <poll.h> instead of <sys/poll.h> in gpioset
 >   - fix a formatting issue in gpioinfo for chips with >100 GPIO lines
 >   - fix a bug when requesting both-edges event notifications

 > Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
 > ---
 > v1 -> v2:
 > - fixed a copy/paste error in the commit message

Committed, thanks.

-- 
Bye, Peter Korsgaard
