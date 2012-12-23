From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Dec 2012 14:26:49 +0100
Subject: [Buildroot] RFC: x11r7.7 patch series
In-Reply-To: <4FDF2526.70901@carallon.com>
References: <4FDF2526.70901@carallon.com>
Message-ID: <20121223142649.460e502f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Will Wagner,

On Mon, 18 Jun 2012 13:55:02 +0100, Will Wagner wrote:
> You can find my work on updating to x11r7.7 on gitorious at 
> https://gitorious.org/willw-buildroot/willw-buildroot/commits/remotes/gitorious/x11r7.7
> 
> There are a few parts to the patch series I am not sure about:
> - I have deleted all packages not in the 7.7 release, this may remove 
> things people still use and feel should still be in buildroot
> - I had a problem updating mesa3d. The newer versions rely on host 
> libxml2 with python support. There are a couple of patches to do this 
> but I don't particularly like these. If someone can come up with 
> something better then great.
> - There was one package I couldn't compile
> xdriver_xf86-input-synaptics. Didn't spend any time on trying to fix
> it though (I suspect broken in current buildroot as well).

What is the status of this work? Do you plan to submit it?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
