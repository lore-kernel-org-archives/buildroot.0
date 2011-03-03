From: Martin Hicks <mort@bork.org>
Date: Thu, 3 Mar 2011 15:20:44 -0500
Subject: [Buildroot] [PATCH] Add package iscsitarget
In-Reply-To: <1299183556-8909-1-git-send-email-mort@bork.org>
References: <1299183556-8909-1-git-send-email-mort@bork.org>
Message-ID: <AANLkTi=O49-M_=LEYVg_+oC4vTA5+jzSpzMDOZ0uLJvd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's worth noting that I chose to import the latest & greatest SVN
commit because the kernel module does not compile against a 2.6.37
kernel.

Thanks,
mh

On Thu, Mar 3, 2011 at 3:19 PM, Martin Hicks <mort@bork.org> wrote:
> This software allows linux systems to export block devices
> as iSCSI targets that initiators can log in to and use.
>
> Signed-off-by: Martin Hicks <mort@bork.org>

-- 
Martin Hicks P.Eng. ?? ? | ? ? ? ? mort at bork.org
Bork Consulting Inc. ? ? | ? +1 (613) 266-2296
