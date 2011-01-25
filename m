From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Jan 2011 10:01:22 +0100
Subject: [Buildroot] [PATCH 3rd RESEND 2/6] Fix gstreamer packages for
	make 3.82
In-Reply-To: <AANLkTimbpB9pdWg2wBPz3Je-CjGPPiduGE-6U9vHCb-4@mail.gmail.com>
	(Felipe Contreras's message of "Tue, 25 Jan 2011 04:51:00 +0200")
References: <1295822495-16972-1-git-send-email-felipe.contreras@gmail.com>
	<1295822495-16972-3-git-send-email-felipe.contreras@gmail.com>
	<877hduitku.fsf@macbook.be.48ers.dk>
	<AANLkTimbpB9pdWg2wBPz3Je-CjGPPiduGE-6U9vHCb-4@mail.gmail.com>
Message-ID: <87lj29pdb1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Felipe" == Felipe Contreras <felipe.contreras@gmail.com> writes:

Hi,

 >> There recently were a number of new gst-* releases. I took a quick look
 >> at gst-plugins-base-0.10.32, an no longer see that gtkdoc line.
 >> Wouldn't it make more sense to update now instead of adding this hack?

 Felipe> Well, _some_ packages have been released: gstreamer core,
 Felipe> plugins base, good, bad and ugly, in short, I think everything
 Felipe> except gst-ffmpeg. And yeah, this is the "next release" I was
 Felipe> talking about, so it might make sense to jump to this release
 Felipe> (if it compiles), but I'm not sure if the hack would still be
 Felipe> needed for some packages.

Could you give it a try? The dist I'm using is still at make-3.81.

-- 
Bye, Peter Korsgaard
