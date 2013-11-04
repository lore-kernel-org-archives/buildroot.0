From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Nov 2013 00:00:30 +0100
Subject: [Buildroot] [PATCH 2/2] qt: don't allow building WebKit on some
	architectures
In-Reply-To: <1383409024-17839-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 2 Nov 2013 17:17:04 +0100")
References: <1383409024-17839-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1383409024-17839-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87vc07ojqp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > WebKit has some architecture specific support, and therefore is not
 > necessarily available for all architectures. Make sure the Qt WebKit
 > option cannot be selected on those architectures that are not
 > supported.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
