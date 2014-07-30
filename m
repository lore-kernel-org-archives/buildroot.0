From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Jul 2014 18:53:41 -0300
Subject: [Buildroot] [PATCH] polarssl: disable microblaze inline assembly
In-Reply-To: <20140730235133.7f4a6442@free-electrons.com>
References: <1406746574-15628-1-git-send-email-gustavo@zacarias.com.ar>
 <20140730235133.7f4a6442@free-electrons.com>
Message-ID: <53D96965.9000205@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/30/2014 06:51 PM, Thomas Petazzoni wrote:

> Applied. But could you report this issue upstream so that it hopefully
> gets fixed in the future? They have a github issue tracker, so it
> should be pretty easy to do.

Yes, i'm doing some more testing to see why/if it can be fixed but my
microblaze assembly knowledge is close to NULL (i guess upstream is as
well since they've disabled SPARC V9 assembly because of similar issues).
Once that's exhausted i'll post an updated fix or just report the
breakage upstream if it's beyond me.
Regards.
