From: J.C. Woltz <jwoltz@gmail.com>
Date: Sun, 9 Dec 2012 19:29:53 -0500
Subject: [Buildroot] [git commit] rt-tests: fix typo in Config.in
 threads negative logic
In-Reply-To: <20121209220341.AFD5E9A0E5@busybox.osuosl.org>
References: <20121209220341.AFD5E9A0E5@busybox.osuosl.org>
Message-ID: <CAC78GpcnHLN8P+jBZu9f4o0WawFMgJus1WAT6roATD=+bt++yQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Dec 9, 2012 at 5:03 PM, Peter Korsgaard <jacmet@sunsite.dk> wrote:

> commit:
> http://git.buildroot.net/buildroot/commit/?id=e510b0fea65cf6e71c6e9c512204b04282973d43
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>  comment "rt-tests requires a toolchain with threads support"
> -       !BR2_TOOLCHAIN_HAS_THREADS
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS
>
>

Thank you, This was driving me crazy...

JC
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121209/cfcfcdf4/attachment.html>
