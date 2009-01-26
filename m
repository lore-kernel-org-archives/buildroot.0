From: Robert Nelson <robert.nelson.work@gmail.com>
Date: Mon, 26 Jan 2009 12:30:42 -0600
Subject: [Buildroot] 2009.02-rc2 released
In-Reply-To: <873af66k0f.fsf@macbook.be.48ers.dk>
References: <87skn9iv5w.fsf@macbook.be.48ers.dk> <497DF1CC.2010404@gmail.com>
	<873af66k0f.fsf@macbook.be.48ers.dk>
Message-ID: <497E0152.9040403@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 1/26/2009 11:43 AM, Peter Korsgaard wrote:
>
>   Robert>  Hi Peter&  Ulf,
>
> .. And the other BR developers ;)
>
>   Robert>  Was just able to test rc-2 for avr32 (atngw100_defconfig and friends)
>
>   Robert>  default atngw100_defconfig is failling at this point in rc2...
>
>   Robert>  /bin/sh: line 2: /usr/bin/glib-genmarshal: No such file or directory
>
> That's a known issue. We don't (yet) build a host version of glib, so
> you need to have the the glib development package (something like
> libglib2.0-dev) installed.
>
> I'll fix the tree to atleast give you a clearer error message if you
> don't have a host glib-genmarshal.
>
>    
Hi,

Sorry for the noise guys... (ssh'd into the wrong test box.. didn't have 
libglib2.0-dev installed..)

Currently rebuilding the avr32 targets... (I have ngw100's and stk1000's 
I can test here..)

Regards,

-- 
Robert Nelson
http://www.rcn-ee.com/
