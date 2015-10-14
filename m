From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Oct 2015 23:15:24 +0200
Subject: [Buildroot] [PATCH v4] systemd: Bump version and change hosting
In-Reply-To: <1443864014-29055-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1443864014-29055-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20151014231524.14ddff71@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sat,  3 Oct 2015 11:20:14 +0200, Maxime Hadjinlian wrote:

> diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
> deleted file mode 100644
> index f746051..0000000
> --- a/package/systemd/systemd.hash
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# Locally calculated
> -sha256  085e088650afbfc688ccb13459aedb1fbc7c8810358605b076301f472d51cc4f  systemd-221.tar.xz

Perhaps you could send a follow-up patch to re-add the hash file
(following the discussion at the meeting regarding hashes for github
downloads) and a bump to 227 ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
