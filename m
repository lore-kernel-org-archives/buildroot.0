From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Oct 2016 11:22:03 +0200
Subject: [Buildroot] [PATCH 1/1] mysql: Make S97mysqld source a default
	file
In-Reply-To: <1476383282-10739-1-git-send-email-eloi.bail@savoirfairelinux.com>
 (Eloi BAIL's message of "Thu, 13 Oct 2016 14:28:02 -0400")
References: <1476383282-10739-1-git-send-email-eloi.bail@savoirfairelinux.com>
Message-ID: <87pon2q85g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eloi" == Eloi BAIL <eloi.bail@savoirfairelinux.com> writes:

 > Hardcoded parameters are used for mysql installation.
 > Make S97mysqld source a /etc/default/mysql file where these
 > parameters can be overridden.

 > Signed-off-by: Eloi BAIL <eloi.bail@savoirfairelinux.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
