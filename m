From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Mar 2021 20:22:56 +0100
Subject: [Buildroot] [PATCH] toolchain: disable gcc bug 60620 if gcc
 version >= 10.x
In-Reply-To: <20210305154139.3682817-1-giulio.benetti@benettiengineering.com>
 (Giulio Benetti's message of "Fri, 5 Mar 2021 16:41:39 +0100")
References: <20210305154139.3682817-1-giulio.benetti@benettiengineering.com>
Message-ID: <87h7l9wpnz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:

 > Since gcc version 10.x bug 60620 doesn't show anymore, so let's make it
 > enabled up to versino 10.x excluded.

 > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
