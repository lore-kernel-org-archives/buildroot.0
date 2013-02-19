From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Feb 2013 16:29:59 +0100
Subject: [Buildroot] Currently packaging Qt5
In-Reply-To: <1361247529229-40702.post@n4.nabble.com>
References: <20130114105802.1199d10e@skate>
 <CAHQn0kiUCGte++HwWEgW6=awTCZ0FNN7kxZ9LxVBnek2p2qZWA@mail.gmail.com>
 <20130114120416.42b34d77@skate>
 <1361247529229-40702.post@n4.nabble.com>
Message-ID: <20130219162959.34295207@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello prabindh,

On Mon, 18 Feb 2013 20:18:49 -0800 (PST), prabindh wrote:

> On below - how can I help ? Note that sgxconfiguro, while useful in
> autoconfigure for egl/gles2, for Qt5 is not especially useful as it
> fails because of missing icu detection via autoconfig. So I reverted
> back to regular configurations via qmake.conf at this time.

If you're interested in Buildroot, the best way you can help is by
creating packages for the SGX stuff needed to bring OpenGL support on
OMAP platforms. That would definitely be useful.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
