From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 27 Jun 2014 20:36:13 +0200
Subject: [Buildroot] [PATCH] lzo: security bump to version 2.07
In-Reply-To: <877g42la16.fsf@dell.be.48ers.dk>
References: <b7658f620fcbca547e5aa330bec28c862e8d59b2.1403843549.git.baruch@tkos.co.il>
 <87wqc2lif0.fsf@dell.be.48ers.dk> <20140627112652.GC4155@tarshish>
 <877g42la16.fsf@dell.be.48ers.dk>
Message-ID: <20140627203613.09a7b284@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Fri, 27 Jun 2014 16:08:53 +0200, Peter Korsgaard wrote:

>  >>>> lzo 2.07 Patching libtool
> 
>  > Applying buildroot-libtool-v2.4.patch using patch: patching file ltmain.sh
>  > Hunk #1 FAILED at 1416.
>  > Hunk #2 FAILED at 2962.
>  > Hunk #3 succeeded at 7964 with fuzz 2 (offset 1281 lines).
>  > Hunk #4 succeeded at 10554 (offset 1297 lines).
>  > 2 out of 4 hunks FAILED -- saving rejects to file ltmain.sh.rej
>  > Patch failed!  Please fix buildroot-libtool-v2.4.patch!
> 
>  > Should I rephrase the comment?
> 
> Yes, please. I guess it is because it uses a too new libtool version?

The libtool script bundled with this package uses "libtool 2.4.2.418",
which we have identified (with Hadrien) as requiring a different patch
that other libtool versions, including libtool 2.4.2. That's something
we will try to work out with Hadrien.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
