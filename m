From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jun 2016 08:38:13 +0200
Subject: [Buildroot] [PATCH] gst1-plugins-bad: disable autoreconf
In-Reply-To: <1466058038-15340-1-git-send-email-marcin.nowakowski@imgtec.com>
 (Marcin Nowakowski's message of "Thu, 16 Jun 2016 08:20:38 +0200")
References: <1466058038-15340-1-git-send-email-marcin.nowakowski@imgtec.com>
Message-ID: <87d1nhabai.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marcin" == Marcin Nowakowski <marcin.nowakowski@imgtec.com> writes:

 > Autoreconf is no longer required in gst1-plugins-bad and it is not
 > done for any other gst package either. With autoreconf disabled,
 > gettextize and a gettext makefile patch are no longer required
 > and can be safely removed.

 > Signed-off-by: Marcin Nowakowski <marcin.nowakowski@imgtec.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
