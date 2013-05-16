From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 16 May 2013 13:06:04 +0200
Subject: [Buildroot] [PATCH v3] graph-depends: ignore the
	'target-purgelocales' target
In-Reply-To: <1368698822-2112-1-git-send-email-danomimanchego123@gmail.com>
 (Danomi Manchego's message of "Thu, 16 May 2013 06:07:02 -0400")
References: <1368698822-2112-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <877giznq03.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Danomi" == Danomi Manchego <danomimanchego123@gmail.com> writes:

 Danomi> Otherwise, graph-depends tries to call 'make
 Danomi> target-purgelocales-show-depends', which does not exist, as
 Danomi> 'target-purgelocales' is not an actual package.

Committed, thanks.

-- 
Bye, Peter Korsgaard
