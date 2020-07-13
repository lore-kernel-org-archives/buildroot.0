From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 13 Jul 2020 21:41:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-pyparted: needs python3
In-Reply-To: <20200713091003.155280-1-fontaine.fabrice@gmail.com>
References: <20200713091003.155280-1-fontaine.fabrice@gmail.com>
Message-ID: <20200713214126.5fc81155@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 13 Jul 2020 11:10:03 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> python3 is a mandatory dependency since version 3.11.5 and
> https://github.com/dcantrell/pyparted/commit/c4949263538784036a5917195f956f8fcda9cf20
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/7d93b4e5c3afebef8c4c19d1c6a0c26e71423191
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/python-pyparted/Config.in | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
