From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Jun 2013 21:52:15 +0200
Subject: [Buildroot] [RFCv1 00/18] Convert the internal toolchain
 backend to packages
In-Reply-To: <CAAXf6LXU3fv0O5hu4hG7f9WaWe_SoAvK5Se=J63ZdHNkszwdOw@mail.gmail.com>
References: <1372188953-29449-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAAXf6LXU3fv0O5hu4hG7f9WaWe_SoAvK5Se=J63ZdHNkszwdOw@mail.gmail.com>
Message-ID: <20130626215215.3cf0699c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Wed, 26 Jun 2013 19:08:33 +0200, Thomas De Schampheleire wrote:

> What about putting all three gcc/gcc-initial/gcc-intermediate packages
> in one directory (three .mk files) and then a common file. This common
> file can contain common rules that can be used by all gcc packages.
> You can make sure that the variables are defined by including the
> common file explicitly from each .mk file (and making sure it doesn't
> match the global 'include package/*/*.mk').

This seems like a good idea, I'll try this out, thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
