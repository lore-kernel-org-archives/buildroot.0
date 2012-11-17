From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Nov 2012 12:06:27 +0100
Subject: [Buildroot] [PATCH 1/2] Deprecate the support for the toolchain
 on target
In-Reply-To: <50A76A1C.6030101@zacarias.com.ar>
References: <cover.1352586949.git.thomas.petazzoni@free-electrons.com>
 <4afe9c298939f3701caa09c2cc5c4bc04f6d4408.1352586949.git.thomas.petazzoni@free-electrons.com>
 <50A02C6D.1040105@mind.be> <20121111235938.358914c5@skate>
 <50A03A24.2010000@mind.be> <87haoowsgi.fsf@dell.be.48ers.dk>
 <50A76A1C.6030101@zacarias.com.ar>
Message-ID: <20121117120627.7860a652@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Sat, 17 Nov 2012 07:42:36 -0300, Gustavo Zacarias wrote:
> On 11/17/2012 05:21 AM, Peter Korsgaard wrote:
> > On the other hand, documentation on the target doesn't have the same
> > problems as toolchain, so if people do use it, I don't have a problem
> > keeping it.
> > 
> > I've never personally used it though.
> 
> On a related note there's no man-pages so the documentation is always
> kind of incomplete. There's no man package either, though busybox has one.
> And i don't recall anyone asking where man-pages is :)
> But it's a no brainer, it doesn't cause any significant overhead.
> Personally i've never used it either.

I also never use it, and I think that many packages do not install
their documentation, so it's most likely very incomplete.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
