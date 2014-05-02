From: clshotwe at rockwellcollins.com <clshotwe@rockwellcollins.com>
Date: Fri, 2 May 2014 10:53:02 -0500
Subject: [Buildroot] Patchwork big patchsets: SELinux
In-Reply-To: <CAAXf6LW8iN=SskGU6x7XkjfVR4NQR-JzE2sNRjYtehHnpu391Q@mail.gmail.com>
References: <CAAXf6LW8iN=SskGU6x7XkjfVR4NQR-JzE2sNRjYtehHnpu391Q@mail.gmail.com>
Message-ID: <OFC7852024.A07AA540-ON86257CCC.005740FD-86257CCC.00574102@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

-----Thomas De Schampheleire <patrickdepinguin@gmail.com> wrote: -----

>To: clshotwe at rockwellcollins.com, rjbarnet at rockwellcollins.com,
>Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
>Date: 04/30/2014 05:21AM
>Cc: buildroot <buildroot@buildroot.org>
>Subject: Patchwork big patchsets: SELinux
>
>
>Hi,
>
>I would like to check on the state of one of the big patchsets in
>patchwork: the SELinux patches posted by Clayton Shotwell.
>
>The last iteration in patchwork is v5, posted in December 2013.
>
>What I would like to know specifically is:
>- what is the state of the patchset?
I have not had any time to touch it since they were last submitted. I probably wont be able to get to them late next month at the earliest. I know all of those packages have had at lease two releases since I submitted the patches so the new versions need to be reintegrated.

>- what is blocking integration of this patchset?
I think mainly review time. The audit package required a large patch to get it to cross compile correctly. That one especially needs to be looked at it again. 

>- what can be done to deblock it?
Me finding free time to revamp the packages. :)

Thanks,
Clayton

Clayton Shotwell
Software Engineer
clshotwe at rockwellcollins.com
www.rockwellcollins.com 
