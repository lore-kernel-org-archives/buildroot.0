From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Oct 2019 16:10:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/python-libconfig: fix build
 with python 3.8
In-Reply-To: <20191025164236.12626-1-fontaine.fabrice@gmail.com>
References: <20191025164236.12626-1-fontaine.fabrice@gmail.com>
Message-ID: <20191026161045.58824bf5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Fri, 25 Oct 2019 18:42:36 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/edf32c178b7912a987e119f776a51f464424dceb
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...python-name-depending-on-current-Pyt.patch | 44 -------------------
>  package/python-libconfig/python-libconfig.mk  | 12 +++++
>  2 files changed, 12 insertions(+), 44 deletions(-)
>  delete mode 100644 package/python-libconfig/0001-Determine-boost_python-name-depending-on-current-Pyt.patch

I've applied, but really this commit log was not descriptive enough.
Could you make sure for your next patches to include more details in
your commit log ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
