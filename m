From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 May 2011 19:01:35 +0200
Subject: [Buildroot] RFC: toolchain wrapper for external toolchains
In-Reply-To: <BANLkTi=w7UaAyk4T2SHjv5h9Pm+gRQW+4g@mail.gmail.com>
References: <1304433655-1629-1-git-send-email-jacmet@sunsite.dk>
	<BANLkTi=w7UaAyk4T2SHjv5h9Pm+gRQW+4g@mail.gmail.com>
Message-ID: <20110508190135.0b9df312@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 5 May 2011 23:44:04 +0200
Peter Korsgaard <jacmet@sunsite.dk> wrote:

> I didn't hear any negative comments either on the list or on IRC, so
> I've committed this.

I am not entirely happy with how things went with this patch set. It
touches a fairly major mechanism in the external toolchain support, and
it has been committed without an official Acked-by from the most active
contributor in this area.

Moreover, it has been committed only two days after the proposal, a
duration which is very short for the other contributors to take the
time to test the patches and give their opinion. This is also very
short compared to the amount of time many other contributions have been
waiting for being merged. For example, have a look at the patch set I
contributed on April, 2nd
(http://lists.busybox.net/pipermail/buildroot/2011-April/042309.html),
which is also something that has been discussed during the FOSDEM
meeting.

And finally, I am also unhappy because these changes were broken in a
basic way: the first test I did with a basic CodeSourcery external
toolchain failed (see the patch I just sent). I don't, by far, claim to
always post well-tested and perfect patches. However, added to the very
quick post-to-commit delay and the absence of real ACK from other
contributors, it makes me a little bit unhappy.

In the future, would it be possible to leave more time between post and
commit, for such major infrastructure changes ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
