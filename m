From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 24 Apr 2014 08:53:59 +0200
Subject: [Buildroot] add ghostscript to buildroot
In-Reply-To: <6387189.ReKiMDKImK@linux-qsenn>
References: <6387189.ReKiMDKImK@linux-qsenn>
Message-ID: <CAAXf6LVyHopuR945-tRuLxrMBRU31=Vo0ksLSosGke0GSG+5Ag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi William,

On Wed, Apr 23, 2014 at 9:11 AM, William Frost <tsmrnd0@gmail.com> wrote:
> Hi everyone,
>
> I have been working with buildroot for little more than one year. I think is
> great tool.

Thanks! And welcome to the community!

> Some months ago I needed to cross-compile DCMTK library (it is not
> included in buildroot) for DICOM image file management and PACS connectivity.
> By following your online help I managed to add this package and successfully
> cross-compile and use it (if needed I can provide the files just let me know
> how).

There is a section in the manual regarding contribution:
http://buildroot.uclibc.org/downloads/manual/manual.html#_contributing_to_buildroot
I think it can guide you.

>
> Anyway, at this moment I need to cross-compile GhostScript (any version is
> good enough for me). But this is really complicated, I'm getting errors every
> where. I notice that openwrt has already included GhostScript
> (https://code.google.com/p/wl500g-repo/source/browse/feeds/rtndev/ghostscript/Makefile?r=1336
> ) so at this moment I'm trying to port this package to buildroot. Buildroot
> and ?openwrt buildroot? are similar tools so I guess that with some
> modifications it can be added to Buildroot. But my Buildroot knowledge it not
> that good (I hope with more time and practice it gets better ;)).

The Makefile you show is not at all similar to the current .mk files
we are using in buildroot.
I think you should describe the exact problems you are facing in
adding ghostscript to buildroot on the list, so we can help you
further in adding it to buildroot.

>
> I need GhostScript to convert ps files to the file that will be sent to the
> printer (I don?t know this format name). I already have a ppd parser, so I
> just need to convert the ps file to the other format to open ?/dev/usb/lp0? and
> write it inside.
>
> Question:
>
> Is there any interest in adding Ghostscript package to buildroot in the near
> future?
> Does anyone has some hints about porting packages from openwrt to buildroot
> that I can use as guide?

We are always interested in accepting new packages to buildroot. It's
great that you want to look into this.
As I said above, I think it's best you describe the exact problems you
are facing, and what your .mk file and Config.in file already looks
like, so we can help you further.

Best regards,
Thomas
