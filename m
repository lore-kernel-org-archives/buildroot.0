From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Mar 2015 00:48:37 +0100
Subject: [Buildroot] [PATCH 1/1] erlang: Fix incorrect use of
 AC_EGREP_CPP.
In-Reply-To: <1427215287-28980-1-git-send-email-johan.oudinet@gmail.com>
References: <1427215287-28980-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20150325004837.171efe44@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Tue, 24 Mar 2015 17:41:27 +0100, Johan Oudinet wrote:

> diff --git a/package/erlang/0004-erts-fix-incorrect-use-of-ac-egrep-cpp.patch b/package/erlang/0004-erts-fix-incorrect-use-of-ac-egrep-cpp.patch
> new file mode 100644
> index 0000000..ca5a88d
> --- /dev/null
> +++ b/package/erlang/0004-erts-fix-incorrect-use-of-ac-egrep-cpp.patch

All patches should have a description + SoB line *inside* the patch
itself. Also, if you submitted the patch upstream, adding a link to the
pull request, or e-mail in the mailing list archives would be useful;

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
