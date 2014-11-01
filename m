From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 21:47:54 +0100
Subject: [Buildroot] [PATCH 19/51] lxc: bump version
In-Reply-To: <1414349157-22749-19-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1414349157-22749-19-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141101214754.16886efc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maxime Hadjinlian,

On Sun, 26 Oct 2014 19:45:25 +0100, Maxime Hadjinlian wrote:
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/lxc/lxc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I've applied, but made some additional changes:

    [Thomas: switch back to a tarball from
    https://linuxcontainers.org/downloads/ instead of
    github. Unfortunately, even though the tarball has the configure
    script generated, we still need to autoreconf since we're patching
    configure.ac.]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
