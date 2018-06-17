From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 17 Jun 2018 17:50:26 +0200
Subject: [Buildroot] [PATCH 1/1] skeleton: PAGER without blank and unset
 at end of for loop
In-Reply-To: <20180605134745.24435-1-F.LaRoche@pilz.de> (Florian La Roche's
 message of "Tue, 5 Jun 2018 15:47:45 +0200")
References: <20180605134745.24435-1-F.LaRoche@pilz.de>
Message-ID: <87a7rtqunx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Florian" == Florian La Roche <F.LaRoche@pilz.de> writes:

 > The PAGER environment variable is including a blank character at the
 > end. Remove this.
 > A for loop has been unsetting the variable inside the loop, this is only
 > needed once at the end of the loop.

 > Signed-off-by: Florian La Roche <F.LaRoche@pilz.de>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
