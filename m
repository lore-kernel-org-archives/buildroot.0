From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 04 Jul 2013 10:38:17 -0300
Subject: [Buildroot] [PATCH] linux-headers: switch to xz format
In-Reply-To: <20130704153548.2d982a19@skate>
References: <1372935038-28722-1-git-send-email-gustavo@zacarias.com.ar>
 <20130704153548.2d982a19@skate>
Message-ID: <51D57AC9.90702@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/04/2013 10:35 AM, Thomas Petazzoni wrote:
> Gaah, thanks, indeed. Sorry for the mis-merge, it has been quite
> challenging to rebase my toolchain changes, since it was each time
> causing huge conflicts, amongst which it was hard to make sure I
> re-applied all the changes that had been made on toolchain/.

No problem, it was better to apply it and get it rolling for the border
cases.
I personally didn't have time to test it before.
I'll be sending some other toolchain patches that i didn't send before
to avoid stalling the toolchain packaging since it was long overdue, and
they're simple so no sweat in rebasing them.
Regards.
