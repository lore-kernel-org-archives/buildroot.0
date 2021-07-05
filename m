From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 5 Jul 2021 20:00:45 +1200
Subject: [Buildroot] [PATCH 1/1] package/syslog-ng: fix tarball hash
In-Reply-To: <20210705051445.3496122-1-fontaine.fabrice@gmail.com>
References: <20210705051445.3496122-1-fontaine.fabrice@gmail.com>
Message-ID: <CAFOYHZDOuGXN+K-49J=zJJMngp93G1_=0JmKZOuuY8h3HyRKTA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jul 5, 2021 at 5:14 PM Fabrice Fontaine
<fontaine.fabrice@gmail.com> wrote:
>
> Tarball hash added by commit 1054a7aaa238253db8b60e4a520a66ad9e1b1eb1 is
> wrong
>
> Fixes:
>  - http://autobuild.buildroot.org/results/1ed64d9a2a707cbd06f9d2af29101b70b668bc06
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/syslog-ng/syslog-ng.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
> index 8ed6042eed..d25eb4f69b 100644
> --- a/package/syslog-ng/syslog-ng.hash
> +++ b/package/syslog-ng/syslog-ng.hash
> @@ -1,5 +1,5 @@
>  # Locally computed
> -sha256  0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5  syslog-ng-3.32.1.tar.gz
> +sha256  19e3b76552d82c71c04230526925402c9f05fa5e6ea19b912b061850929b712d  syslog-ng-3.32.1.tar.gz

Well I have no idea where I got that hash from. At first I thought I
may have got the "archive" link instead of the "download" one but
recalculating them now I get the result Fabrice has here and something
different for the "archive" link.

I could swear I at least build tested this but clearly not. I shall
endeavor to be more careful in the future.

>  sha256  e912cf1e1c09b81d61c0154eb6c179588622c31ad07bfb4a90c612d07ff09d9b  COPYING
>  sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
> --
> 2.30.2
>
