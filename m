From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Feb 2014 21:37:18 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-02-23
In-Reply-To: <CAAXf6LX0eoYHR7PUb8MvZdJFiQN29Tt8CBf8iFqY8wFa3FFetw@mail.gmail.com>
References: <20140224073008.3ECD8100F60@stock.ovh.net>
 <CAAXf6LVNCe6OeGpe8sngvwErdQPgfbFfHg8f2mxmZBPqajL8AQ@mail.gmail.com>
 <877g8kn6qf.fsf@dell.be.48ers.dk>
 <CAAXf6LX0eoYHR7PUb8MvZdJFiQN29Tt8CBf8iFqY8wFa3FFetw@mail.gmail.com>
Message-ID: <20140224213718.4ae77597@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Mon, 24 Feb 2014 12:37:11 +0100, Thomas De Schampheleire wrote:

> > Yes, but that relies on the TOOLCHAIN_HEADERS_AT_LEAST_x stuff. Do we
> > want that for 2014.02?
> 
> It may be very short before the deadline for a patch series like this,
> but if you ask me, I would dare to apply it still.

Even though I really believe the patch series is good, I don't think it
should be applied now. We're 4 days before the end of the month, and
therefore before the release. It is too risky to apply such a patch
series now. I'm fine with adding more autobuilder exceptions for now,
until Yann series is merged after the release.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
