From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 12 Feb 2013 11:37:56 +0100
Subject: [Buildroot] [PATCH] vim: Add option to remove documentation
 from target
In-Reply-To: <CAG2jQ8hkN+TDA5EPYtbxOLk_AQxMx=imBW=_m0bJq_yiMrKuaw@mail.gmail.com>
References: <1360664095-16562-1-git-send-email-markos.chandras@gmail.com>
 <20130212113010.014297ac@skate>
 <CAG2jQ8hkN+TDA5EPYtbxOLk_AQxMx=imBW=_m0bJq_yiMrKuaw@mail.gmail.com>
Message-ID: <20130212113756.037ddea0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Markos Chandras,

On Tue, 12 Feb 2013 10:35:02 +0000, Markos Chandras wrote:

> Thanks for the reply. This BR2_HAVE_DOCUMENTATION option is marked as
> "deprecated" so I was not sure if we should use it anymore or not. I
> will prepare a new patch.

Right, it's deprecated, because we believe that installing the
documentation on the target is useless in Buildroot's context. So we
don't want BR2_HAVE_DOCUMENTATION to be replaced by new, package
specific options that do the same thing :-)

For now, I'd say: use BR2_HAVE_DOCUMENTATION, so that the day we decide
to finally remove it, we can easily grep in the source code to find the
things we can remove or simplify.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
