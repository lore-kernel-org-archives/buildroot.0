From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 29 Dec 2012 22:30:46 +0100
Subject: [Buildroot] [PATCH 7/7] docs/manual: do not suggest to create a
 symlink for shared download directory
In-Reply-To: <1356792153-24033-8-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1356792153-24033-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1356792153-24033-8-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMMKqkvvXjqXx=XLs7s+tYujVcHvGe1wcq6aKJVQdKt-pSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, all,

2012/12/29 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Creating a symbolic link for the download directory is really not a
> useful suggestion, since we have the much better solution of the
> BUILDROOT_DL_DIR environment variable. So emphasize this solution
> instead, and remove the suggestion of the symbolic link.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Samuel Martin <s.martin49@gmail.com>

Regards,

-- 
Sam
