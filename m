From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 May 2013 11:18:29 +0200
Subject: [Buildroot] [PATCH] external-toolchain: Allow MIPS64 for
 Codesourcery MIPS toolchains
In-Reply-To: <CAG2jQ8hK4nY2mL4PQEX8miQyCZLbvV=H9scJu8ZaQPNZnnruNw@mail.gmail.com>
References: <1368627740-4094-1-git-send-email-markos.chandras@gmail.com>
 <20130526152910.2a32ecbb@skate>
 <CAG2jQ8hK4nY2mL4PQEX8miQyCZLbvV=H9scJu8ZaQPNZnnruNw@mail.gmail.com>
Message-ID: <20130527111829.42368807@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Mon, 27 May 2013 10:05:10 +0100, Markos Chandras wrote:

> I did limited testing and I haven't seen this problem but I haven't
> build busybox to be honest.
> However, on the release notes they say they support MIPS64/n64
> https://sourcery.mentor.com/GNUToolchain/release2358?@template=datasheet
> 
> so I just allowed buildroot to select this combination as well.
> 
> My understanding is that the compilation problem is orthogonal to
> mip64/n64 patch in the sense
> that forbidding the combination just hides the problem for now :)

I agree that the problem is orthogonal, but having an external
toolchain that isn't even capable of building Busybox worries me a
little bit. This means that an user selecting mips64 and external
toolchain, and keep all the other options as default, will see a
failing build. Not really nice.

We have various issues with the toolchain from Mentor Graphics. It
would be nice if we could have some contact to help solve those issues.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
