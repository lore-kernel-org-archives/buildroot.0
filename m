From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 23:29:16 +0100
Subject: [Buildroot] [PATCH 1/1] package/samba4: fix build without
 python3
In-Reply-To: <20191215173629.516288-1-fontaine.fabrice@gmail.com>
References: <20191215173629.516288-1-fontaine.fabrice@gmail.com>
Message-ID: <20191222232916.45898672@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 15 Dec 2019 18:36:29 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> python3 is mandatory since version 4.11 and
> https://gitlab.com/samba-team/samba/commit/63d20d7822ead1626f7cb41fdbae6c9300893314
> 
> The only way to build samba4 without python3 is to disable python
> bindings through --disable-python option
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/c4bb3d41fa07e38f0360a563bdcb4a368740cfe5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/samba4/samba4.mk | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
