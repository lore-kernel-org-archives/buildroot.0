From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 5 Nov 2015 22:42:03 +0100
Subject: [Buildroot] [PATCH] bind: fix intermittent build issues with
 high BR2_JLEVEL
In-Reply-To: <1446721054-15603-1-git-send-email-heyleke@gmail.com>
References: <1446721054-15603-1-git-send-email-heyleke@gmail.com>
Message-ID: <20151105224203.77337e4b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jan Heylen,

Thanks for your patch!

On Thu,  5 Nov 2015 11:57:34 +0100, Jan Heylen wrote:
> From: Peter Korsgaard <jacmet@sunsite.dk>

I am not sure it is appropriate to send a patch in the name of someone
else. Maybe you're taking one of Peter's previous commit, and
re-applying it, but the context is different, so I believe it should be
under your own name.

> 
> Build sometimes breaks with:
> 
> libtool: link: `unix/os.lo' is not a valid libtool object
> make[3]: *** [rndc-confgen] Error 1
> make[3]: *** Waiting for unfinished jobs....
> make[4]: Leaving directory `/scratch/peko/build/bind-9.6-ESV-R4/bin/rndc/unix'
> 
> So disable parallel builds.

I've been trying to reproduce the parallel build issue, and I haven't
been able to do so. It seems our autobuilders also didn't catch it.

How often are you able to reproduce it ? On what type of build machine ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
