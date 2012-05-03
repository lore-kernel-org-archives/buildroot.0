From: Dimitry Golubovsky <golubovsky@gmail.com>
Date: Thu, 3 May 2012 14:43:26 -0400
Subject: [Buildroot] read-edid package - clarifications
In-Reply-To: <20120503182245.GB2763@tarshish>
References: <CADiAo4J4T_bcDzospg7e9Hr_HvUJ8qGBegrda6BsUFrnzttx8A@mail.gmail.com>
 <20120503182245.GB2763@tarshish>
Message-ID: <CADiAo4+Gt-DmYXC2Fji2m1hjQpMQ7XtHQz7x-x0J6C6Hu-7n=A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch,

On Thu, May 3, 2012 at 2:22 PM, Baruch Siach <baruch@tkos.co.il> wrote:
>
> No I haven't tested your patch. I just run 'get-edid | parse-edid' from the
> read-edid package of my distro (Debian).

Per http://packages.debian.org/search?keywords=read-edid&searchon=names&suite=all&section=all

I believe your read-edid is of version 2.0.x but mine is 1.4.x

I could not get through with 2.0.0 compilation for some reason -
messed up headers in liblrmi - but 1.4.x compiled and worked fine.

1.4.x is only for i386 and powerpc (which I obviously could not test).

Thanks for clarification.

I'll try to submit a refined patch later tonight.

-- 
Dimitry Golubovsky

Anywhere on the Web
