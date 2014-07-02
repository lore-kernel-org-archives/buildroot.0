From: Mike Zick <minimod@morethan.org>
Date: Wed, 2 Jul 2014 04:53:07 -0500
Subject: [Buildroot] Glibc LD_LIBRARAY_PATH error
In-Reply-To: <53B3AB05.7050503@mind.be>
References: <CAMhj5sakLa9ROf4RVO2N1rhRx+4du=j3X8OL5rLVRAUQRnFS+Q@mail.gmail.com>
 <20140628000126.4bfd6329@free-electrons.com>
 <CAMhj5sZkdpe+mrTzvxqrwK=-tOoyG4nvobM48PJJpw3oFcb5CA@mail.gmail.com>
 <20140628083612.167f7b88@free-electrons.com>
 <CAMhj5sbiKrQ7PkbrxXr=CK34x2LA2bFu95asfCv8iKS5UtEMiQ@mail.gmail.com>
 <20140628162843.41a203d7@free-electrons.com>
 <CAMhj5saaeT9uoHNk2CZLf8da=ds8Zr0r2va15GFdZwrqxe0ENA@mail.gmail.com>
 <CAMhj5sYLbx5_4-qQhtpsYO6+fewS+tU1sDSDB9qn1CqJ-QoyiQ@mail.gmail.com>
 <20140628174420.2fd3ed86@free-electrons.com>
 <53B2F9E1.7080609@mind.be>
 <20140701220703.0fa13b8a@free-electrons.com>
 <20140701160904.34c80062@core2quad.morethan.org>
 <53B3AB05.7050503@mind.be>
Message-ID: <20140702045307.29f2719b@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 02 Jul 2014 08:47:33 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > Even a further out use case -
> > The applications requiring a LD_LIBRARY_PATH setting, where the
> > application(s) are used in a POST_**_SCRIPT, but the source isn't
> > available to build-in the appropriate DT_RUNPATH/DT_RPATH?  
> 
>  To be honest, I think that use case is so far out that we don't need
> to consider it, and anyway the user has two easy solutions:
> 
> - don't use a POST_**_SCRIPT but wrap something around the Makefile;
> 
> - create a wrapper for the binaries that require LD_LIBRARY_PATH
> (like java apps typically do).
> 

That all sounds reasonable to me.

Call this case "too far out" to consider,
or considered and tossed.

Mike
