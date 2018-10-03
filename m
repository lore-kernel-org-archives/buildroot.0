From: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Date: Wed, 3 Oct 2018 10:22:37 -0300 (BRT)
Subject: [Buildroot] [PATCH v3 2/2] support/scripts/pkg-stats: URL check
 using threads
In-Reply-To: <20181003145419.2f76fe63@windsurf>
References: <1538447849-46511-2-git-send-email-matthew.weber@rockwellcollins.com>
 <5bb4123cbed5b_6f723fa9ec08e7bc6558f@ultri5.mail>
 <20181003145419.2f76fe63@windsurf>
Message-ID: <1607595726.1212538.1538572957381.JavaMail.zimbra@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Wednesday, October 3, 2018 9:54:19 AM, Thomas Petazzoni wrote:

> On Tue, 02 Oct 2018 21:50:04 -0300, Ricardo Martincoski wrote:
[snip]
>> Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> 
> So this threading works for you? I think it is modeled after what I
> initially did to retrieve the upstream version of the packages, and you
> said it wasn't working well for you.

Yes. It is working for me.

Actually you used threading + Queue, and I suggested you to switch to
use multiprocessing.
https://patchwork.ozlabs.org/patch/890236/

Matt uses multiprocessing in this patch.

Regards,
Ricardo
