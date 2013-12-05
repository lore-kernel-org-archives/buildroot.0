From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 5 Dec 2013 20:45:11 +0100
Subject: [Buildroot] [PATCHv7 4/5] core: allow external defconfigs to be
	used
In-Reply-To: <1386270673-16051-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386270673-16051-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386270673-16051-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAHXCMMJg_VmYRp=g3DBf5PfcbwS54ZTW6ZwW-9=DLwdo1Ejk1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/12/5 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

> This commit allows the user to store defconfigs in
> $BR2_EXTERNAL/configs/. To achieve this:
>
>  * It adds a new %_defconfig that looks in $BR2_EXTERNAL/configs/ for
>    the corresponding defconfig file.
>
>  * Updates the help target to also list external defconfigs.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Acked-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
>
Tested-by: "Samuel Martin" <s.martin49@gmail.com>
Acked-by: "Samuel Martin" <s.martin49@gmail.com>


Regards,

--
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131205/9774ceb3/attachment.html>
