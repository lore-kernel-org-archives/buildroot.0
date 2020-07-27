From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Jul 2020 15:10:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/refpolicy: needs python3
In-Reply-To: <20200716205939.1965929-1-fontaine.fabrice@gmail.com>
References: <20200716205939.1965929-1-fontaine.fabrice@gmail.com>
Message-ID: <20200727151019.3cf49e5b@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 16 Jul 2020 22:59:39 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 09b94b1e8f94d1f49f7a2349b4c8cbfecefa73da forgot to propagate
> python3 dependency from host-setools to refpolicy
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/fdeaa54355aa0741eccc7864b034a7b07ef0c4bc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/refpolicy/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

This issue was fixed in
https://git.buildroot.org/buildroot/commit/package/python-networkx?id=09b94b1e8f94d1f49f7a2349b4c8cbfecefa73da,
in a different/better way, that still allows to use SELinux without
python3 on the targe.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
