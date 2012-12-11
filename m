From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 11 Dec 2012 18:24:12 +0100
Subject: [Buildroot] Large File Support
In-Reply-To: <000901cdd7a9$98377ab0$c8a67010$@co.uk>
References: <000901cdd7a9$98377ab0$c8a67010$@co.uk>
Message-ID: <CAHXCMMJk7KvzSATvMd0eqd28VYG+650GHsgAJA+chQMEZoTqiw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ted,

2012/12/11 Ted Wood <ted@fgh.co.uk>:
> I hope this isn?t an inappropriate place for this...
Yes, you're in the right place ;)

> I?m  completely new to Embedded Linux, and am hoping to use Buildroot as the
> basis for a new project.
> I?m using the November 2012 release.
> I?m trying to build for an i586 using the internal toolchain. The make fails
> with the error ?It appears you have defined _FILE_OFFSET_BITS=64.
> Unfortunately uLibc was built without large file support?
Did you change some setting in the "Toolchain" Buildroot menu after
building the toolchain?
In that case a full rebuild is highly recommended (for further
information, see
http://buildroot.org/downloads/manual/manual.html#full-rebuild)

> I?m pretty sure I didn?t request that when I was doing menuconfig. Web
> search suggests that this problem has occurred elsewhere. There is an option
> to select Large File Support under toolchain, but toggling it makes no
> difference.

When does this happen? (i mean what is the package build that fails).
Could you pastebin the build log and your .config


BTW, don't hesitate to browse the doc, you may avoid some pitfalls:
http://buildroot.org/downloads/manual/manual.html


Regards,

-- 
Sam
