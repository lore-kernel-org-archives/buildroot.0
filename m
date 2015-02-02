From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 2 Feb 2015 17:22:35 +0100
Subject: [Buildroot] [PATCH 06/16] package/dosfstools: add missing
	symlinks
In-Reply-To: <1421684056-5266-7-git-send-email-maxtram95@gmail.com>
References: <1421684056-5266-1-git-send-email-maxtram95@gmail.com>
 <1421684056-5266-7-git-send-email-maxtram95@gmail.com>
Message-ID: <CAHXCMMJznL9yE8HLLszsj=GZLKWJ42Worgd1CeqpmeCUAqvDjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 19, 2015 at 5:14 PM, Maxim Mikityanskiy <maxtram95@gmail.com> wrote:
> Install alternative symlinks for dosfstools mkfs.fat, fsck.fat and
> fatlabel. Those symlinks are generally installed by make install, but
> buildroot does not use make install for dosfstools, but symlinks should
> be installed anyway.
>
> Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,


-- 
Samuel
