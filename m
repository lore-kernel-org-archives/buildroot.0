From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 21 Feb 2013 21:41:06 +0100
Subject: [Buildroot] [PATCH] busybox: remove pid file after stopping
	daemon with start-stop-daemon applet
In-Reply-To: <1361473963-5943-1-git-send-email-stefan.froberg@petroprogram.com>
 ("Stefan =?utf-8?Q?Fr=C3=B6berg=22's?= message of "Thu, 21 Feb 2013
 21:12:43 +0200")
References: <1361473963-5943-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <87d2vtfli5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stefan" == Stefan Fr?berg <stefan.froberg@petroprogram.com> writes:

 Stefan> Many daemons leave pid files lying around when they are stopped with
 Stefan> start-stop-daemon applet in BusyBox.
 Stefan> This patch will ensure that they are properly cleaned away.

 Stefan> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
 Stefan> ---

 Stefan> Note: I did not make this patch but found it from old thread in BusyBox
 Stefan> mailing list from 2006 and just fitted it against v1.19.4.
 Stefan> So far it has been tested to work with busybox v1.19.4.

Sorry, we don't carry feature patches in Buildroot (certainly not for
actively developed software like Busybox).

Please submit the patch to upstream busybox instead.

-- 
Bye, Peter Korsgaard
