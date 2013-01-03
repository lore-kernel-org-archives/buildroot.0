From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Jan 2013 11:42:52 +0100
Subject: [Buildroot] [PATCH 10/20] xdriver_xf86-video-s3: remove package
In-Reply-To: <50E4875F.6090305@zacarias.com.ar>
References: <cover.1357125961.git.thomas.petazzoni@free-electrons.com>
 <44205c6a9db9d3496db982f686d29fe9d096a088.1357125961.git.thomas.petazzoni@free-electrons.com>
 <50E43558.2000003@petroprogram.com> <20130102175740.359fc5ce@skate>
 <50E48268.401@zacarias.com.ar> <20130102200144.5ed56106@skate>
 <50E4875F.6090305@zacarias.com.ar>
Message-ID: <20130103114252.18661c1e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 02 Jan 2013 16:15:43 -0300, Gustavo Zacarias wrote:
> On 01/02/2013 04:01 PM, Thomas Petazzoni wrote:
> 
> > Here I'm really only removing things that the X.org project
> > considers as unmaintained. So I would prefer if you could raise the
> > fact that the SiS driver is still useful to the X.org people, so
> > that they keep this driver. I don't think we can reasonably keep an
> > unmaintained X.org driver in Buildroot if we want to easily
> > continue to upgrade the other X.org packages.
> 
> Hmm?
> I'm just pointing to the fact that i can test the sis (not sisusb....
> completely different monster) driver, which is supported.

Since you were replying to a patch removing a X.org driver because the
driver has been removed from X.org releases, I thought your SiS driver
was in this case, but it's not.

So, your point was that beyond the driver I removed, a bunch of others
could be removed, because even though X.org still has those drivers in
their releases, the hardware is so ancient that it doesn't make sense
to keep the drivers?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
