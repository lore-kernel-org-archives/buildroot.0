From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jul 2013 15:06:26 +0200
Subject: [Buildroot] [PATCH] system: only set the root password if it's
 not empty
In-Reply-To: <CAAXf6LVNOFmX9HXAMEJH=mbRkgmhfAxqqiL8e+Qkrsw_jxU9Eg@mail.gmail.com>
References: <20130702085224.GA25620@berrier.lan>
 <20130702173111.GA3221@free.fr> <20130703044618.GA4406@berrier.lan>
 <CAAXf6LVNOFmX9HXAMEJH=mbRkgmhfAxqqiL8e+Qkrsw_jxU9Eg@mail.gmail.com>
Message-ID: <20130728150626.5b57ffae@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 28 Jul 2013 10:40:15 +0200, Thomas De Schampheleire wrote:

> Should we create a separate host-mkpasswd package based on the whois
> sources? (https://github.com/rfc1036/whois)
> Or should we add the whois package, and depend on that?
> To me, the former seems more appropriate...

If we can make a very simple host-mkpasswd package like we have the
host-makedevs package (with the source code included in
package/<dir>/), I think it would be good.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
