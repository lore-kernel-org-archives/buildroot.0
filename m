From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 5 Jun 2015 15:07:41 +0200
Subject: [Buildroot] [PATCH 10/12] fs/iso9660: add hybrid image support
In-Reply-To: <1433430330-2166-11-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433430330-2166-11-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMMJ_5E11tv8Ly1wFGc+HeTJAjpeO6RNZKHMpcuF5q6Do_g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all,

On Thu, Jun 4, 2015 at 5:05 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> This commit adds a new option, which allows, when isolinux is used as
> the bootloader, to generate an "hybrid" ISO image. Such images can
> either be booted from CD-ROM or from USB keys. It simply uses the
> isohybrid tool provided by syslinux.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
