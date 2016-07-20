From: Michael Habibi <mikehabibi@gmail.com>
Date: Wed, 20 Jul 2016 09:26:41 -0500
Subject: [Buildroot] Workflow question - separating the distribution from
	embedded applications
Message-ID: <CAOsp8o8U3=xT4u6y33Om125WCk+wPzn_bYbzKEBYbiV=dUqzig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We are looking at switching to a buildroot-based distribution from our
current option for our embedded device. Right now, we have a giant
source tree that combines both the distribution and our applications
to build a root filesystem that contains everything. This makes things
simple as everything is co-located in one source tree. However it
complicates and extends the build because we must rebuild the
distribution with our code in order to build a complete image.

With buildroot, I imagine we can do the same thing since it also
builds a root filesystem. However I am trying to understand a workflow
where we could build the distribution's root filesystem of the
distribution separate from our embedded applications. A workflow where
the application developers only have to build their code and not the
whole distribution, and can 'insert' their applications into the
distribution somehow and just regenerate the final images. I know I
can create packages for the embedded applications and separate them in
repos, but it seems that we still have to have the developers do the
distribution build in that scenario.

Are there some common workflows that I can use as a guide or basis in this area?

Thanks for your help

Michael
