From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 22 Jun 2010 08:57:55 +0200
Subject: [Buildroot] Perl for buildroot
In-Reply-To: <4C20527D.10407@tiedyenetworks.com>
References: <4C20527D.10407@tiedyenetworks.com>
Message-ID: <20100622085755.6f2a59e1@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Jun 2010 23:04:45 -0700
mike <mike-buildroot@tiedyenetworks.com> wrote:

>     So microperl doesn't do everything I'd want and anyways I would 
> really rather have a more full perl implementation along with more libs 
> and a newer rev and such, but building perl for a cross compiled 
> environment (especially on 5.12.2) seems excessively hairy. Does anyone 
> have a working makefile for buildroot for perl? It seems openwrt does 
> have a fairly complete perl build along with many numerous modules but 
> this doesn't look very easy to port over either so I'm hoping to cheat 
> and find a good makefile for it.

I had a look at our bug tracker for pending patches, and we don't seem
to have any pending patch for full Perl support. I've also look at our
mailing list archives: a few people have been asking for full Perl
support since quite some time, but it doesn't seem that anyone actually
did the job.

So I think you're good to go :-)

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
