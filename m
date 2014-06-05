From: Dallas Clement <dallas.a.clement@gmail.com>
Date: Thu, 5 Jun 2014 17:06:48 -0500
Subject: [Buildroot] autoconf caching
In-Reply-To: <20140605224222.0184a9b7@free-electrons.com>
References: <CAE9DZUT8+z0NF5O6sh=y4svCfQW0bh1Zt4r7OM9fe9nYvk-O0w@mail.gmail.com>
 <20140605224222.0184a9b7@free-electrons.com>
Message-ID: <CAE9DZURmNL1iOcY4UR4CrDkg5DOT46-yy-e1+Ftax1_W0faing@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 5, 2014 at 3:42 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear Dallas Clement,
>
> On Thu, 5 Jun 2014 11:34:41 -0500, Dallas Clement wrote:
>
> > I'm getting killed by autoconf.  My builds take 1.5 hours even with
> ccache
> > turned on.  Most of the cores in my very impressive build machine are
>
> Could you post the build-time.log file of your build, and the .config
> file you're using? What are the specifications of your build machine?
> Do you build inside a virtual machine ? Do you build over NFS ?
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>

You bet.  Please see attached.  I'm in the process of fully upgrading over
to latest buildroot / master from 2012.08 so there is probably still some
deprecated stuff in my .config.

My build machine is a HP server with 8 core Intel(R) Xeon(R) CPU E5-2637 v2
@ 3.50GHz.  The OS is RHEL 6.4 64 bit.  No virtual machine and no NFS.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140605/84cb13bb/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 47018 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140605/84cb13bb/attachment-0002.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: build-time.log
Type: application/octet-stream
Size: 119578 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140605/84cb13bb/attachment-0003.obj>
