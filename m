From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Oct 2017 13:23:46 +0200
Subject: [Buildroot] [PATCH 1/1] package/nodejs: bump version to 8.8.1
In-Reply-To: <1509012451-24161-1-git-send-email-martin@barkynet.com> (Martin
 Bark's message of "Thu, 26 Oct 2017 11:07:31 +0100")
References: <1509012451-24161-1-git-send-email-martin@barkynet.com>
Message-ID: <87h8um2lvh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Martin" == Martin Bark <martin@barkynet.com> writes:

 > See https://nodejs.org/en/blog/release/v8.8.1/
 > Signed-off-by: Martin Bark <martin@barkynet.com>

I've applied this on top of the 8.8.0 bump (so we know the 8.8.x series
fixes security issues) and updated the commit message to mention that
this fixes a regression, thanks.

-- 
Bye, Peter Korsgaard
