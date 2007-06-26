From: Ben Dooks <ben@fluff.org>
Date: Tue, 26 Jun 2007 23:25:00 +0100
Subject: [Buildroot] ARM EABI builds
In-Reply-To: <468182D7.30509@gmail.com>
References: <20070626133327.GA5989@trinity.fluff.org>
	<468182D7.30509@gmail.com>
Message-ID: <20070626222500.GP31791@trinity.fluff.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 26, 2007 at 02:19:19PM -0700, Tom wrote:
> Ben Dooks wrote:
> >Has anyone had success with building an EABI buildroot? I have tried
> >building ARM (arm920t,gcc 4.1.2) and the image produced hangs (it
> >seems vfprintf does not work)
> >
> >I have succesfully built images with gcc 4.1.2 and a patch to make it
> >build gcc with OABI.
> >
> 
> Yes, I had success. (After an issue described in "[Buildroot] Arm / 
> buildroot / kernel issue: init crashes?", maybe this is your problem too.)

Next time, could you please post an URL, it doesn't seem to be trivially
findable with google.

I have tried EABI build with what should be an EABI only kernel, and this
still shows that /bin/sh is not running to a point where you can interact
with it.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
