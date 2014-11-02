From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Nov 2014 10:38:11 +0100
Subject: [Buildroot] Samba4 build issue
In-Reply-To: <545577D9.1040405@zacarias.com.ar>
References: <20141101233957.7ca9aabd@free-electrons.com>
 <545577D9.1040405@zacarias.com.ar>
Message-ID: <20141102103811.16e499df@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sat, 01 Nov 2014 21:16:25 -0300, Gustavo Zacarias wrote:

> > Is this some new kernel headers dependency? Dependency on the attr
> > package?
> > 
> > If you could have a look, it would be great.
> 
> No, it's a bump from an autodep that's breaking havoc.
> Blame 57280c2f244500ac6616377b3b8eab458c1ead23.
> The release is all kinds of wrong apparently, even 2.23 breaks and more
> horribly than 2.24.
> So let's just roll back to 2.22 until a detailed analysis can take place
> to fix it.

Ok, so it's libcap causing issues. Have those issues reported upstream?
While reverting to an older version libcap being an acceptable
temporary workaround, it's not going to be nice on the long run;

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
