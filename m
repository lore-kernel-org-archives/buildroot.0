From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 25 Jan 2011 10:02:07 +0100
Subject: [Buildroot] [PATCH 3rd RESEND 6/6] Add gst-omapfb package
In-Reply-To: <AANLkTimFBvGJdW975fEObvwh9L5cK9vS5o7EbWr=qV83@mail.gmail.com>
	(Felipe Contreras's message of "Tue, 25 Jan 2011 04:55:47 +0200")
References: <1295822495-16972-1-git-send-email-felipe.contreras@gmail.com>
	<1295822495-16972-7-git-send-email-felipe.contreras@gmail.com>
	<87lj2ahe4y.fsf@macbook.be.48ers.dk>
	<AANLkTimFBvGJdW975fEObvwh9L5cK9vS5o7EbWr=qV83@mail.gmail.com>
Message-ID: <87hbcxpd9s.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Felipe" == Felipe Contreras <felipe.contreras@gmail.com> writes:

 Felipe> On Mon, Jan 24, 2011 at 10:58 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
 >>>>>>> "Felipe" == Felipe Contreras <felipe.contreras@gmail.com> writes:
 >> 
 >> ?Felipe> Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
 >> ?Felipe> Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 >> 
 >> And here.

 Felipe> Well, there's no 'uninstall' in upstream. Should I add a patch to the
 Felipe> Makefile, or shall I manually remove the files (in gst-dsp and
 Felipe> gst-omapfb it's just one file, and in the other packages there are
 Felipe> very few).

Just remove the files.

 >> Thinking a bit more about it - For the omap3 stuff, they are all with A8
 >> cores, so we could even do 'depends on BR2_cortex_a8', right?

 Felipe> I guess so.

Ok, good.

 >> Is this omap3 specific like the rest, or would it also work on E.G. the
 >> pandaboard?

 Felipe> That's a good question. I don't think the OMAP4 display sub-system
 Felipe> works right now, so it's hard to tell, but in theory it should work.

Ok, thanks.

-- 
Bye, Peter Korsgaard
