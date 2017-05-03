From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 May 2017 17:24:22 +0200
Subject: [Buildroot] [PATCH] dtc: bump version to 1.4.4
In-Reply-To: <20170503123215.20544-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 3 May 2017 14:32:15 +0200")
References: <20170503123215.20544-1-peter@korsgaard.com>
Message-ID: <87pofqc6ah.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Adds overlay support.
 > Drop the non-upstreamed 0002-extra-cflags.patch and instead simply pass the
 > needed CFLAGS as make arguments.  Passing the full upstream warning flags
 > are not important in the Buildroot context, so this is simpler than
 > maintaining a patch.

 > Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
