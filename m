From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Jan 2021 08:02:33 +0100
Subject: [Buildroot] [PATCH 1/2] linux,
 package: do not use <pkg>_NAME when defining CPE ID variables
In-Reply-To: <20210114223432.456542-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 14 Jan 2021 23:34:30 +0100")
References: <20210114223432.456542-1-thomas.petazzoni@bootlin.com>
Message-ID: <87pn26fzsm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > As we discussed on the mailing list, using $(<pkg>_NAME) when defining
 > CPE ID variables feels a bit odd and needlessly complicated. Just use
 > the package name directly.

 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
