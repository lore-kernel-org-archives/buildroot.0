From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jun 2013 08:59:19 +0200
Subject: [Buildroot] [RFC] post-build scripts: limitations, and proposal
In-Reply-To: <CAAXf6LVO6Rz3RXLW++kOOfaHGRvR_4AB8Mi=VS2S-pKhJSm5Lw@mail.gmail.com>
References: <20130620213628.GA3534@free.fr>
 <CAAXf6LVO6Rz3RXLW++kOOfaHGRvR_4AB8Mi=VS2S-pKhJSm5Lw@mail.gmail.com>
Message-ID: <20130621085919.4f2c6579@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, Thomas,

On Fri, 21 Jun 2013 08:17:05 +0200, Thomas De Schampheleire wrote:

> Instead of passing multiple scripts, you could just pass one wrapper
> post build script, without options. This wrapper would be different in
> your different configurations, and would call all relevant scripts in
> turn. Adding a script for a certain configuration now no longer means
> updating the buildroot configuration, but instead updating the wrapper
> script.

This is absolutely what should be done in Yann's case. There's no need
to make the post-build script mechanism in Buildroot more complicated,
just handle the complexity in our own scripts, it is much more
flexible.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
