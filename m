From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Tue, 9 Sep 2008 01:15:34 +0200
Subject: [Buildroot] [PATCH] Ignore errors on rmdir in clean-targets
In-Reply-To: <200809081055.50940.michel@crondor.net>
References: <200809081055.50940.michel@crondor.net>
Message-ID: <200809090115.35311.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michel Wilson, 08.09.2008:
> Inline this time, hopefully KMail is not a 'broken mailer' in this regard.

The patch is malformed, it contains some wrapped lines. The same for your
"disable cursor in X" patch.

I use KMail, too. But because of inline patches and text formatting, I use
gvim as mail editor. You have to disable the line length (default 78) then.
My setting is: gvim -f --cmd "set tw=78" %f
Then you have the limited line length with text formatting and can add patches
by pasting or reading in with :r

You can disable the line length without using an external editor and the patch
should arrive find, but then you loose the automatic text formatting of KMail.
You cannot have both at once.

There is also a trick, but I don't think the usage is widespread. See the file
Documentation/email-clients.txt in the Linux source tree.

Markus
