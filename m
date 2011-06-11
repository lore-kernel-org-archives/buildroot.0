From: Dwi Sasongko Supriyadi <ruckuus@gmail.com>
Date: Sat, 11 Jun 2011 15:18:52 +0700
Subject: [Buildroot] Generic serial port disappear after udev started
In-Reply-To: <201106101349.34083.minimod@morethan.org>
References: <BANLkTinE9E==rnL=NJSKkW=SELY=bZbHJg@mail.gmail.com>
	<201106101349.34083.minimod@morethan.org>
Message-ID: <BANLkTin2zmDHQibO6ALkWQ3shcS5uwJ2Gw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 11, 2011 at 1:49 AM, Michael S. Zick <minimod@morethan.org>wrote:

> On Fri June 10 2011, Dwi Sasongko Supriyadi wrote:
> > Hello List,
> >
> > Normally i put getty on serial port which is /dev/ttySAC0 and so far
> there
> > is no issue with it, but after udev installed and started, the system
> > complains that it can not find /dev/ttySAC0.
> >
> > VFS: Mounted root (nfs filesystem).
> > Freeing init memory: 624K
> > Populating /dev using udev: done
> >
>
> Is /dev on nfs?
>

Yes, right.


> that might be the problem, nfs makes files, not device nodes.
>
>
Understood. Does it mean the only solution is to mount /dev as tmpfs?

The same issue shown up when I use flash filesystem, but I did not test it,
just from memory (if I clearly recall). Later in the day I will update it.

Thanks for the support
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110611/255f6570/attachment-0001.html>
