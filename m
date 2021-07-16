From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Jul 2021 23:33:55 +0200
Subject: [Buildroot] [PATCH 1/2] package/libhtp: bump to version 0.5.38
In-Reply-To: <20210702192548.956881-1-fontaine.fabrice@gmail.com>
References: <20210702192548.956881-1-fontaine.fabrice@gmail.com>
Message-ID: <20210716233355.5e255464@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri,  2 Jul 2021 21:25:47 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> https://github.com/OISF/libhtp/releases/tag/0.5.38
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libhtp/libhtp.hash | 2 +-
>  package/libhtp/libhtp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Both patches applied, thanks. However, it would have been nice to make
it clear whether the htp bump to 0.5.38 is necessary for the suricata
security bump. Since you sent both in the same series, I assumed it was
the case, but I think it is important to make it clearer in the commit
logs. Indeed, when Peter will review all the commits in "master" to
consider them for the LTS branch, he will see the suricata "security
bump", so he will backport it, but not necessarily that the libhtp bump
is needed together with the suricata bump (if it's the case).

Thanks a lot,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
