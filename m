From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Sep 2013 17:48:21 +0200
Subject: [Buildroot] [RFC] Effective Patchwork Use and Patch Review
In-Reply-To: <OFD4BE18C9.32F86585-ON86257BE8.004CBA65-86257BE8.005044AA@rockwellcollins.com>
References: <OFD77E15AC.FCFBC1CA-ON86257BE5.005BB4D9-86257BE5.005BB4FE@rockwellcollins.com>
 <20130914074740.424283aa@skate>
 <CAAXf6LWLmdBcOh5q9YvLtzHaSmfeeZbG-yjkfzZMdTeAVDC+zA@mail.gmail.com>
 <OFD4BE18C9.32F86585-ON86257BE8.004CBA65-86257BE8.005044AA@rockwellcollins.com>
Message-ID: <20130916174821.41a0c368@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Mon, 16 Sep 2013 09:36:44 -0500, Ryan Barnett wrote:

> > Agreed. When I wrote that patchwork improved the situation, I meant
> > that patchwork provided a good overview of outstanding patches, both
> > for reviewers as for maintainers.
> 
> OK that fine. I was just wondering if anyone had used patchworks
> to write some scripts to pull patches down and then mark-up and send 
> the review back out over email. My email client is a pain for this so
> I was just wondering if there was a way to not use it...

No, the only person using scripts for patchwork is really the
maintainer, so that when he applies patches, they are automatically
marked as "Applied" on the patchwork.

Also, since I (and a few other core developers) have some kind of admin
access to patchwork, we can mark patches as Superseded, Rejected, etc.
But we do this with the web interface.

> Under Section 10.2 of the manual, would it be useful to update this 
> say explicitly state that the review takes place over the mailing 
> list? Currently I think the section implies it that but doesn't
> say it explicitly. 

Sure, if anything is unclear in the manual, it's certainly worth making
it explicit.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
