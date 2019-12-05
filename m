From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 05 Dec 2019 22:11:00 +0100
Subject: [Buildroot] [PATCH 1/1] package/prosody: bump to bugfix version
 0.11.3
In-Reply-To: <20191129102805.17515-1-jubalh@iodoru.org> (Michael Vetter's
 message of "Fri, 29 Nov 2019 11:28:05 +0100")
References: <20191129102805.17515-1-jubalh@iodoru.org>
Message-ID: <87sglypjff.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Michael" == Michael Vetter <jubalh@iodoru.org> writes:

 > This is a bugfix release for the stable 0.11 branch. It is recommended
 > for all users of 0.11.x to upgrade.

 > Important note for those upgrading: Previous releases did not
 > automatically expire messages from group chat (MUC) archives, so if
 > mod_muc_mam was loaded and enabled for a MUC, archives would grow
 > indefinitely. This is not what most deployments want, therefore
 > automatic expiry is now implemented and enabled with a default 7 day
 > retention. You can configure this with the muc_log_expires_after
 > configuration option, which can be set to "never" to restore the old
 > behaviour and preserve any existing logs older than 7 days.

 > For details see:
 > https://prosody.im/doc/release/0.11.3

 > Signed-off-by: Michael Vetter <jubalh@iodoru.org>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
