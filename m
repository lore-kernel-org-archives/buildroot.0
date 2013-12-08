From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 08 Dec 2013 23:40:19 +0100
Subject: [Buildroot] [PATCH 02/38] dialog: remove useless POST_CLEAN
	command
In-Reply-To: <1386540907-7242-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 8 Dec 2013 23:14:31 +0100")
References: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386540907-7242-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87txej7yr0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > For some reason, the dialog package has a DIALOG_POST_CLEAN variable,
 > which doesn't match any of the variables understood by the
 > infrastructure. This commit gets rid of it.

 > This was noticed while reviewing the packaging of python-dialog.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
