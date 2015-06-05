From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 5 Jun 2015 14:09:37 +0200
Subject: [Buildroot] [PATCH 06/12] fs/iso9660: change the location of
 the splash image
In-Reply-To: <1433430330-2166-7-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1433430330-2166-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1433430330-2166-7-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMMJJfVNBK7cPJWDLnXfxyUK3TF7KxfrirOy1cEEn5NqLGw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 4, 2015 at 5:05 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> In order to simplify the introduction of the support for using ISO9660
> as the real root filesystem, this commit changes the location of the
> grub splash image. This makes it match where the splash image in
> $(TARGET_DIR).
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Samuel
