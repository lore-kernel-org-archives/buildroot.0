From: Chris Sparks <mr_ada@cox.net>
Date: Wed, 20 Jul 2016 07:32:57 -0700
Subject: [Buildroot] New to list
In-Reply-To: <Lkuj1t0012yBjFQ01kukAW>
References: <b1af7fd6-45cc-3564-1840-d85a32cf414e@cox.net>
 <Lkuj1t0012yBjFQ01kukAW>
Message-ID: <7ee4a94a-0cf0-918f-29c8-181707323e34@cox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Manuel,

Thanks.  I figured out how to get that package installed.  I just 
decided to build the standard
Pi3 Configuration instead.  I haven't gotten a build to work yet. From 
download issues to
in-operability.  I hope someone else who has been successful with 
getting a Pi3 sdcard to work
can chime in and help me out.

On a different note would it better that I clone the repository instead 
of download ZIPs?  It seems
that with all of the activity I might benefit from 
fetching/pulling/rebasing.  I was hopeful that I
would get lucky and the first time it would work for me, but that seems 
to be unrealistic.

Thanks,
Chris
> I don't have an Ubuntu 16.04 at my fingertips right now, but errors
> like this on Ubuntu usually mean the required package is not installed.
> Try installing 'ncurses-dev' or 'libncurses5-dev' using apt-get, and
> menuconfig should work fine. This worked for me on Ubuntu 12/14 at
> least.
> There are also other package requirements for using buildroot, as you
> can see in the documentation[0] (ncurses is listed in the ?Optional
> packages?). Just in case anything else might be missing.
>
> I hope this helps you using menuconfig.
>
> As for the problems with your Raspberry Pi 3, I unfortunately can not
> help you, since I never used the device myself.
>
> [0] https://buildroot.org/downloads/manual/manual.html#requirement

---
This email has been checked for viruses by Avast antivirus software.
https://www.avast.com/antivirus
