From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 5 Jun 2015 14:11:42 +0200
Subject: [Buildroot] [PATCH 07/12] fs/iso9660: prepare cleaner
 kernel/initrd path handling
In-Reply-To: <1433430330-2166-8-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433430330-2166-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMM+W1giDe2XzOupcCBM52uWLaCozLw35v6pqOM4SVj6zUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 4, 2015 at 5:05 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> The iso9660.mk modifies the menu.lst file from Grub to set the correct
> initrd/kernel image locations. However, with the upcoming support of
> other bootloaders for iso9660 filesystems, we need to modify a bit
> this logic.
>
> Instead of relying on the specific details of the grub menu.lst
> syntax, we introduce the __KERNEL_PATH__ and __INITRD_PATH__ magic
> keywords, which iso9660.mk will replace by the appropriate
> values. They can therefore be used where needed in grub menu.lst, and
> in similar configuration files of other bootloaders, as will be
> supported in the following commits.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
