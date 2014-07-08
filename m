From: Henry Margies <henry.margies@gmail.com>
Date: Tue, 8 Jul 2014 17:43:31 +0100
Subject: [Buildroot] [PATCH 1/1] Build Python with tzset support
In-Reply-To: <20140708162840.5983803f@free-electrons.com>
References: <1404825833-1075-1-git-send-email-henry.margies@gmail.com>
 <20140708162840.5983803f@free-electrons.com>
Message-ID: <6B5AC78D-66CA-4C7D-AF6C-B2B9C181FA65@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

thanks for the review.

On 8 Jul 2014, at 15:28, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:
> However, it would be nice to also submit a similar patch for the
> python3 package. Also, we should really audit all the AC_RUN_IFELSE()
> invocation from Python configure.ac script to see which cache variables
> should be prefilled from the pyhon{3,}.mk.

I will create and send a separate patch for Python3 tomorrow. I just tried it on my test system and it works ok. The tzset-check is actually the same in Python 2.7 and 3.

And I also agree that it would be nice to check the configure script, pity it is such a long one :) I?ll have a look tomorrow to see if I can spot anything obvious.



Best regards,

Henry
