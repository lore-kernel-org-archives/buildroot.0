From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Jan 2020 22:04:33 +0100
Subject: [Buildroot] Problem generating rootfs for ci20 defconfig
In-Reply-To: <CAJ4jsackLicBx5naQiNu+hCWZ45Jbx8cqRCK9sLaSHrDTE1pNg@mail.gmail.com>
 (Carlos Santos's message of "Mon, 20 Jan 2020 13:41:20 -0300")
References: <87muaimcqg.fsf@igalia.com>
 <CAJ4jsafbQ9GBLYd=x95B7QZ=AAd2AdLH-+iuPNnEqhkGfKZ1uw@mail.gmail.com>
 <87lfq2mbiz.fsf@igalia.com>
 <CAJ4jsackLicBx5naQiNu+hCWZ45Jbx8cqRCK9sLaSHrDTE1pNg@mail.gmail.com>
Message-ID: <877e1kzfku.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <unixmania@gmail.com> writes:

Hi,

 > Perhaps we should drop the size parameter for rootts in
 > board/*/genimage.cfg and let genimage always use the size of the
 > filesystem image.

I was thinking the same. I sent a patch for ci20, but it indeed probably
makes sense to do it for all defconfigs.

https://patchwork.ozlabs.org/patch/1226767/

-- 
Bye, Peter Korsgaard
