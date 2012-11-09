From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Nov 2012 10:18:10 +0100
Subject: [Buildroot] [PATCH] perl: build with perlcross instead of qemu
In-Reply-To: <509CC99A.4010700@mind.be>
References: <1352425626-10628-1-git-send-email-arnout@mind.be>
 <878vab8cr8.fsf@dell.be.48ers.dk>
 <CABtOAfzb9n8HQ9Xbk1+1KnmTh7hHyxiQvD_7vPw5afs3YDyZMg@mail.gmail.com>
 <509CC99A.4010700@mind.be>
Message-ID: <20121109101810.6f61c6a9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Fri, 09 Nov 2012 10:15:06 +0100, Arnout Vandecappelle wrote:

>   Doesn't make sense.  perlcross has to be extracted over the perl source: it
> replaces a few configuration scripts and creates a few more.  There is nothing
> in there to install on the host or on the target.

First of all, thanks a lot for doing this work.

Do you have details on how perl-cross is maintained with regard to
perl? I.e, is it kept reasonably updated with new perl versions, or is
it a hack that works on a single perl version that will force us to
stay with only this version of perl?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
