From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 7 Oct 2008 09:26:48 +0200
Subject: [Buildroot] [RFC] add option for installing uClibc test suite
 to target
In-Reply-To: <20081007035338.GC5127@cloud.net.au>
References: <20081002170506.54c8fa86@atmel.com>
	<20081007035338.GC5127@cloud.net.au>
Message-ID: <20081007092648.3562ab76@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 7 Oct 2008 14:53:38 +1100
Hamish Moffatt <hamish@cloud.net.au> wrote:

> On Thu, Oct 02, 2008 at 05:05:06PM +0200, Hans-Christian Egtvedt
> wrote:
> > Any comments on the patch? I plan to add it to BR.
> 
> Looks fine to me! I didn't try it but it seems harmless if not
> enabled.
> 

I committed it, although, changed the install point to /root/uClibc,
since LTP does the same. Updated the help stuff as well to reflect this.

-- 
Best regards,
Hans-Christian Egtvedt
