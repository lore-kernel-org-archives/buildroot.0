From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Nov 2012 20:39:14 +0100
Subject: [Buildroot] [PATCH 1/1] libmbus : bump version to 0.8
In-Reply-To: <1352164803-8201-1-git-send-email-sagaert.johan@skynet.be>
 (Sagaert Johan's message of "Tue, 6 Nov 2012 02:20:03 +0100")
References: <1352164803-8201-1-git-send-email-sagaert.johan@skynet.be>
Message-ID: <87txt1cie5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

 Sagaert> This release contains many improvements bug fixes, and major
 Sagaert> new features and support for float point numbers and support
 Sagaert> for multi-telegram communication...

Looks like we can also drop the autoreconf. Committed with that fixed,
thanks.

-- 
Bye, Peter Korsgaard
