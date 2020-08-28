From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Aug 2020 17:06:43 +0200
Subject: [Buildroot] [PATCH v2] package/f2fs-tools: fsck should use
 correct returncodes
In-Reply-To: <20200807092002.155878-1-nolange79@gmail.com> (Norbert Lange's
 message of "Fri, 7 Aug 2020 11:20:01 +0200")
References: <20200807092002.155878-1-nolange79@gmail.com>
Message-ID: <87wo1ix118.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Norbert" == Norbert Lange <nolange79@gmail.com> writes:

 > fsck.f2fs does not implement the returncodes from the fsck interface.
 > This is particularly bad if systemd is used with a root f2fs partition,
 > as it will interpret the rc as order to reboot.

 > for thread & pending upstream fix see:
 > https://sourceforge.net/p/linux-f2fs/mailman/message/37079401/

 > Signed-off-by: Norbert Lange <nolange79@gmail.com>
 > ---
 > v2:
 > - use revised upstream patch
 > - redo the rebase/patch with git
 > - keep the commit intact with author info etc

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
