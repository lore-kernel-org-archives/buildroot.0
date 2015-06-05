From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 5 Jun 2015 14:08:34 +0200
Subject: [Buildroot] [PATCH 05/12] fs/iso9660: rename all variables to
 use the ROOTFS_ISO9660 prefix
In-Reply-To: <1433430330-2166-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433430330-2166-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMMLKcyuCWi+g2Q3Tjs4h+5=2CJjG_PZnUPfJZQKWSwu4RQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 4, 2015 at 5:05 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> For consistency reasons, this commit renames all internal variables of
> iso9660.mk to use the ROOTFS_ISO9660 prefix.
>
> While we're at it, replace a useless ':=' by '='.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
