From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Oct 2014 12:14:59 +0100
Subject: [Buildroot] [PATCHv2 buildroot-test 01/11] autobuild-run:
 check-requirements does not need to know the login details
In-Reply-To: <CAAXf6LUw-7815B8ffeSpqLGgeRjtXCdkhjg+vYEpaXg=Do2v8Q@mail.gmail.com>
References: <1413747007-24990-1-git-send-email-patrickdepinguin@gmail.com>
 <1413747007-24990-2-git-send-email-patrickdepinguin@gmail.com>
 <20141019225918.57f55ebf@free-electrons.com>
 <CAAXf6LX4SQsCCnbU5aR37KypC+QUx3ryVPk4hoiceQebu9ic4Q@mail.gmail.com>
 <87fve95rd4.fsf@dell.be.48ers.dk>
 <CAAXf6LUw-7815B8ffeSpqLGgeRjtXCdkhjg+vYEpaXg=Do2v8Q@mail.gmail.com>
Message-ID: <20141028121459.375b3583@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Tue, 28 Oct 2014 12:10:50 +0100, Thomas De Schampheleire wrote:

> >  > Hmm, indeed.
> >  > But then I think we better add do_send_results to kwargs so the value
> >  > can be calculated once and used multiple times. Btw, if you have a
> >  > better name than do_send_results, that would be great. I'd pick
> >  > 'send_results' but it's already the function name...
> >
> > What about 'upload'?
> 
> Sounds good to me.
> Thomas Petazzoni: do you agree?

Fine with me.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
