From: Rob Landley <rob@landley.net>
Date: Thu, 3 Aug 2006 16:39:16 -0400
Subject: [Buildroot] make troubles
In-Reply-To: <1154584855.22773.13.camel@turing>
References: <1154584855.22773.13.camel@turing>
Message-ID: <200608031639.17238.rob@landley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 03 August 2006 2:00 am, Robert Carter wrote:
> make[1]: Entering directory `/home/rob/buildroot/build_i686/busybox'
>   CC modutils/lsmod.o
> /home/rob/buildroot/build_i686/busybox/modutils/lsmod.c: In function
> `lsmod_main':
> /home/rob/buildroot/build_i686/busybox/modutils/lsmod.c:96: warning:
> dereferencing type-punned pointer will break strict-aliasing rules
> /home/rob/buildroot/build_i686/busybox/modutils/lsmod.c:114: warning:
> dereferencing type-punned pointer will break strict-aliasing rules
> make[2]: *** [/home/rob/buildroot/build_i686/busybox/modutils/lsmod.o]
> Error 1

Odd.  I'm not seeing that.  Still, I just committed svn 15773 in an attempt to 
make this go away.  Try now?

If that doesn't work, you could always use the stable version of BusyBox 
(1.2.1).  We have actual releases which are recent enough to matter. :)

Rob
-- 
Never bet against the cheap plastic solution.
