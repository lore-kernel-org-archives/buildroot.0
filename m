From: Dwi Sasongko Supriyadi <ruckuus@gmail.com>
Date: Sat, 11 Jun 2011 16:10:27 +0700
Subject: [Buildroot] Generic serial port disappear after udev started
In-Reply-To: <20110611104855.23b50569@skate>
References: <BANLkTinE9E==rnL=NJSKkW=SELY=bZbHJg@mail.gmail.com>
	<201106101349.34083.minimod@morethan.org>
	<20110611104855.23b50569@skate>
Message-ID: <BANLkTik-EXZ+5erZ8JCZPLMGV46u+qpPcg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 11, 2011 at 3:48 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Le Fri, 10 Jun 2011 13:49:31 -0500,
> "Michael S. Zick" <minimod@morethan.org> a ?crit :
>
> > Is /dev on nfs?
> > that might be the problem, nfs makes files, not device nodes.
>
> Huh?
>
> I routinely use root-over-NFS, including the /dev with static device
> nodes, and it works just fine.
>
>
Interesting, have you tried udev package with NFS root?

Thanks
DWI
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110611/4ea467d3/attachment.html>
