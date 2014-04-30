From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Apr 2014 16:50:57 +0200
Subject: [Buildroot] The uClibc saga: next steps
In-Reply-To: <CAAXf6LUQb3a57R-ztncPtsRvouP=PxjoWn1fC1Xy3+XLhNTErA@mail.gmail.com>
References: <CAAXf6LUQb3a57R-ztncPtsRvouP=PxjoWn1fC1Xy3+XLhNTErA@mail.gmail.com>
Message-ID: <20140430165057.1ea20579@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 30 Apr 2014 12:48:10 +0200, Thomas De Schampheleire wrote:

> Unfortunately, this approach failed to work, as did previous attempts.
> The discussion on the uClibc mailing list is at [2].
> 
> Hence, I think it is time to discuss the next steps, which could possibly be:
> - create a 'fork' of uClibc that just makes releases out of the
> existing code in the uClibc sources.
> - go forward with the plan to stop using uClibc as default C library,
> and either promote musl or (e)glibc.
> - (other possible steps here...)
> 
> What do you think?

I met Khem Raj yesterday at ELC, and we spent a good amount of time
discussing the uClibc status. He is in contact with Bernhard, the
official maintainer, and tries to get things moving. Hopefully, we
should see something changing in the next few months.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
