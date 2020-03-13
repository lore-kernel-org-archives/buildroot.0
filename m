From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Mar 2020 16:42:38 +0100
Subject: [Buildroot] [PATCH] support/testing/glxinfo: explicitely enable
 GLX
In-Reply-To: <878sl4kteu.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sat, 15 Feb 2020 11:59:37 +0100")
References: <20200213214045.535684-1-romain.naour@smile.fr>
 <878sl4kteu.fsf@dell.be.48ers.dk>
Message-ID: <87tv2sz2fl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Romain" == Romain Naour <romain.naour@smile.fr> writes:
 >> Since [1], the GLX support is enabled by BR2_PACKAGE_MESA3D_OPENGL_GLX
 >> symbol.

 >> Since [2], only one swrast provider can be built.
 >> Keep BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST.

 >> Fixes:
 >> https://gitlab.com/buildroot.org/buildroot/-/jobs/400391349

 >> [1] 5cb821d5635626b7327d5d704555c412e5ed5a1f
 >> [2] 09a0a285076f544de335efc74c8904e464576575

 >> Signed-off-by: Romain Naour <romain.naour@smile.fr>
 >> ---
 >> To be backported to 2019.11.x

 > Committed, thanks.

 > I will get to the 2019.11.x backports once -rc1 is out. Please ping me
 > in case I forget.

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
