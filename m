From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 May 2013 22:04:35 +0200
Subject: [Buildroot] [PATCH v7 00/10] add Gstreamer 1.X for gst-omx
 support
In-Reply-To: <CAEBucnAfh3MsG9itFTxmb53cnTyFT7XAhewGQS3zXCoLigN3qw@mail.gmail.com>
References: <1369588343-13950-1-git-send-email-spenser@gillilanding.com>
 <20130527202508.662f74ab@skate>
 <CAEBucnAfh3MsG9itFTxmb53cnTyFT7XAhewGQS3zXCoLigN3qw@mail.gmail.com>
Message-ID: <20130527220435.5ab17b79@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Mon, 27 May 2013 14:58:46 -0500, Spenser Gilliland wrote:

> Im working on the bump to webkit 1.9.6.  So far, this requires a libsoup
> and libgtk2 bump as well.

Ok.

> Due to the tight dependencies between libglib2/webkit, the patch will not
> be bisectable unless the webkit and libglib2 bump occur atomically. (the
> libgtk2 and libsoup bumps may or may not be required to occur atomically.)
> This makes this single patch quite large; therefore, im unsure if I should
> make this a monolithic patch or a series of non bisectable patches (there
> may also be a no-ff merge option.)

Send them as separate patches, and make it explicit in your cover
e-mail which patches are in fact so closely related together than we
might want to apply them all at once.

Peter will then be able to decide whether he'll want to take them as a
single patch, or as separate patches.

> Im currently working on narrowing down a couple remaining issues but should
> be able to send out the patches by end of tomm.

Excellent, thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
