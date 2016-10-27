From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Oct 2016 10:56:30 +0200
Subject: [Buildroot] [git commit] core/pkg-generic: check proper package
	installation
In-Reply-To: <20161027104658.6edfaae3@free-electrons.com> (Thomas Petazzoni's
 message of "Thu, 27 Oct 2016 10:46:58 +0200")
References: <20161026203713.9732A7FD9B@busybox.osuosl.org>
 <878ttajief.fsf@dell.be.48ers.dk>
 <20161027104658.6edfaae3@free-electrons.com>
Message-ID: <87mvhqi30h.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> > And a new step hooks to check that no file gets installed in either
 >> > location, called after the install-target and install-staging steps.  
 >> 
 >> Didn't we just discuss that this duplicates the proposed
 >> leak-of-host-paths stuff Samuel is working on?

 > It does, but Samuel's work is not merged, and this is already useful by
 > itself. It can always be removed once Samuel's work is merged.

 > I guess Samuel is working first on the host rpath relativization, then
 > the target rpath cleanup, and finally the target "leak of host path"
 > stuff. So it might be a while before Samuel's patches are ready and
 > merged.

 > And Yann's patch has already uncovered an issue with the Bellagio
 > package.

Ok, fine by me. I just wondered as the patch had comments and you afaik
applied it without any notification.

-- 
Venlig hilsen,
Peter Korsgaard 
