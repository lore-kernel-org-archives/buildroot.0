From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Jul 2017 16:59:47 +0200
Subject: [Buildroot] [PATCH] azure-iot-sdk-c: Bump to version 2017-06-30
In-Reply-To: <20170716161901.5a88cc27@windsurf>
References: <1499277201-14030-1-git-send-email-nerv@dawncrow.de>
 <20170715120954.68067f9b@windsurf>
 <20170715124432.1573e49b@windsurf>
 <87lgnpal7b.fsf@dell.be.48ers.dk>
 <20170716161901.5a88cc27@windsurf>
Message-ID: <20170716145947.GC30047@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-07-16 16:19 +0200, Thomas Petazzoni spake thusly:
> On Sat, 15 Jul 2017 15:22:48 +0200, Peter Korsgaard wrote:
> 
> >  > So, I'm wondering what to do. Should I give up testing Buildroot on
> >  > Debian Squeeze, and move to Debian Wheezy instead?  
> > 
> > With stretch out, I indeed think it makes sense to move away from
> > squeeze. According to wikipedia squeeze is no longer supported (since
> > Feb 2016):
> > 
> > https://en.wikipedia.org/wiki/Debian_version_history#Release_table
> > 
> > In general, I don't think it makes sense to test on any distribution no
> > longer supported by their upstream.
> 
> Following your feedback and Yann's feedback, I've updated my chroot
> from Squeeze to Wheezy. I've checked, and now Git clones from
> github.com are working, as are wget downloads from cdn.kernel.org. This
> should hopefully avoid a lot of bogus download failures.

Thank you Thomas for having run this old distro for the autobuilders for
so long, and most importantly for bringing in patches to fix those
autobuild failures.

Thanks! :-)

So long, Squeeze, and thanks for all the fish! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
