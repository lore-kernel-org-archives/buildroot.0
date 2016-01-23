From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 23 Jan 2016 17:07:29 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20160123165816.05338d25@free-electrons.com>
References: <20160123154220.06518c9d@free-electrons.com>
 <56a39930cd84_671a180a0ec59869@ultri2.mail>
 <20160123165816.05338d25@free-electrons.com>
Message-ID: <CAAXf6LVpYZ7vkXWLPB373i0dXDSaLP3tGi+MXWaoVzbXMY_byQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Jan 23, 2016 4:58 PM, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> On Sat, 23 Jan 2016 13:16:00 -0200, Ricardo Martincoski wrote:
>
> > Just to be clear, removing the double quotes makes it work with
> > patch 2.5.9 or later.
> > Patch 2.5.4 can't handle spaces in filenames.
> > (I tested using only the versions with tarballs available, that's the
cause of
> > the gap 2.5.9 -> 2.5.4, see http://ftp.gnu.org/gnu/patch/)
>
> RHEL4 uses patch 2.5.4
> (http://ftp.redhat.com/pub/redhat/linux/enterprise/4/en/os/i386/SRPMS/).
> RHEL4 was released January 2005
>
> RHEL5 also seems to be using patch 2.5.4
> (http://ftp.redhat.com/pub/redhat/linux/enterprise/5Client/en/os/SRPMS/).
> RHEL5 was released March 2007.
>
> It's only starting at RHEL6 that patch 2.6 starts to be used
> (http://ftp.redhat.com/pub/redhat/linux/enterprise/6Client/en/os/SRPMS/).
> RHEL6 was released November 2010.
>
> Thomas DS, you are one of our users relying on very old enterprise
> distros. Are you still on RHEL 4/5 ?

There are some of our users still on RHEL4 (hopefully not too much anymore)
and RHEL5 (not negligible yet).

That said, libsoil is not something we use, so if the problem is limited to
that we're fine.

/Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160123/0bcc064b/attachment.html>
