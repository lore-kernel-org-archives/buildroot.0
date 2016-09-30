From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Sep 2016 11:54:38 +0200
Subject: [Buildroot] [PATCH 2/2] package/nodejs: bump version to 6.7.0
In-Reply-To: <1475176366-30034-2-git-send-email-martin@barkynet.com> (Martin
 Bark's message of "Thu, 29 Sep 2016 20:12:46 +0100")
References: <1475176366-30034-1-git-send-email-martin@barkynet.com>
 <1475176366-30034-2-git-send-email-martin@barkynet.com>
Message-ID: <87intdyaox.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:

 > https://nodejs.org/en/blog/release/v6.7.0/
 > The patches from 6.2.1 have been copied to 6.7.0 with the following
 > changes:

 > - Add 0002-inspector-don-t-build-when-ssl-support-is-disabled.patch
 >   to disable the new V8 inspector when openssl is not included.

Committed, thanks. Don't forget to send the patch upstream!

-- 
Bye, Peter Korsgaard
