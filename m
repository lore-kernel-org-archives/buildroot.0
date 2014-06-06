From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Jun 2014 09:15:48 +0200
Subject: [Buildroot] autoconf caching
In-Reply-To: <CAE9DZURmNL1iOcY4UR4CrDkg5DOT46-yy-e1+Ftax1_W0faing@mail.gmail.com>
References: <CAE9DZUT8+z0NF5O6sh=y4svCfQW0bh1Zt4r7OM9fe9nYvk-O0w@mail.gmail.com>
 <20140605224222.0184a9b7@free-electrons.com>
 <CAE9DZURmNL1iOcY4UR4CrDkg5DOT46-yy-e1+Ftax1_W0faing@mail.gmail.com>
Message-ID: <20140606091548.53f07f90@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Dallas Clement,

On Thu, 5 Jun 2014 17:06:48 -0500, Dallas Clement wrote:

> You bet.  Please see attached.  I'm in the process of fully upgrading over
> to latest buildroot / master from 2012.08 so there is probably still some
> deprecated stuff in my .config.

There is another thing that strikes out in your configuration: there
are many packages that we don't have in Buildroot, and that don't seem
to be specific to your company or project. What about submitting your
new packages upstream?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
