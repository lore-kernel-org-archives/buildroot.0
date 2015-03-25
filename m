From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Mar 2015 20:08:09 +0100
Subject: [Buildroot] [PATCH v2 1/1] erlang: fix incorrect use of
 AC_EGREP_CPP
In-Reply-To: <1427296020-12945-1-git-send-email-johan.oudinet@gmail.com>
References: <1427296020-12945-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20150325200809.3beab93d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Wed, 25 Mar 2015 16:06:59 +0100, Johan Oudinet wrote:
> Using 'AC_EGREP_CPP(yes' without restraining the pattern always return
> true if it runs from a path containing the string 'yes'.
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> ---
>  ...04-erts-fix-incorrect-use-of-ac-egrep-cpp.patch | 79 ++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 package/erlang/0004-erts-fix-incorrect-use-of-ac-egrep-cpp.patch

Applied! Thanks a lot for having quickly posted an updated version of
the patch!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
