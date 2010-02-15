From: Marc Garnier <marc.garnier@heig-vd.ch>
Date: Mon, 15 Feb 2010 12:22:16 +0100
Subject: [Buildroot] Using an external Linux tree
Message-ID: <4B792E68.6020907@heig-vd.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Have you found the solution?

*Cliff Holden* Cliff.Holden at Atheros.com 
<mailto:buildroot%40busybox.net?Subject=Re%3A%20%5BBuildroot%5D%20Using%20an%20external%20Linux%20tree&In-Reply-To=%3CD302D58E77B2A2448F54114C6F143271EC45E9F17E%40SC1EXMB-MBCL.global.atheros.com%3E>
/Mon May 11 17:53:32 UTC 2009/
------------------------------------------------------------------------

Hi all,

I'm somewhat new to buildroot, but have been building kernels for a while.  I have a general question:

What is the proper procedure for using an external linux kernel tree in the build?  
Our SCC system (source code control) is set up to have various kernel versions located in a particular location.  
If I could get buildroot to "point" to this external kernel, it would be helpful.

I did try the "advanced" options that allows the specification of a kernel version and an external "patch" file, 
which is close, but the custom kernel I have is not set up as a set of patches.  
I would like an option to simply specify the path of the kernel source for the build to use.

Any suggestions would be appreciated.

Thanks!!


-- 
///////////////////////////////////////////// 
Marc Garnier
R&D Certified Engineer

eMbedded Information Systems Institute (MIS)
University of Applied Sciences, Vaud
rue Galil?e 15
1400 Yverdon-les-Bains
Switzerland

Tel : +41 (0)24 423 97 71
Fax : +41 (0)24 423 97 59
URL : http://mis.heig-vd.ch
