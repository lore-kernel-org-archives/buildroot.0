From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sun, 1 May 2016 14:38:27 -0400
Subject: [Buildroot] [PATCH] syslinux: fix boot hang when host-gcc is 5.3
In-Reply-To: <20160501191438.64efbf4c@free-electrons.com>
References: <1462118287-5017-1-git-send-email-fhunleth@troodon-software.com>
 <20160501191438.64efbf4c@free-electrons.com>
Message-ID: <CA+-urNSq678vxKvpLgcyNHXLLCjwSeOdLjeAiezh_WBjN9pKGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sun, May 1, 2016 at 1:14 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> Hello,
>
> On Sun,  1 May 2016 11:58:07 -0400, Frank Hunleth wrote:
> > Syslinux uses the host version of gcc to build to bootloader. On systems
> > with gcc 5.3, this results in a bootloader that hangs. This issue has
> > been addressed in upstream syslinux, but an official release has not
> > been made yet. This commit adds the upstream patch to fix the issue.
> >
> > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
>
> Thanks! Do you think this could fix bug
> https://bugs.busybox.net/show_bug.cgi?id=8866 ?

Yes, I'm pretty sure that this patch will fix it. I added a comment to
the bug report.

Frank
