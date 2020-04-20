From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Apr 2020 17:59:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/lvm2: add missing dependency to
 lvmetad
In-Reply-To: <20200420152557.824148-1-fontaine.fabrice@gmail.com>
References: <20200420152557.824148-1-fontaine.fabrice@gmail.com>
Message-ID: <20200420175940.0b0a132f@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 20 Apr 2020 17:25:57 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit 9889b8ce7fcef50fb5089f6e3e84b54f730d0ca6 forgot to propagate
> dependency from lvm2-app-library to lvmetad
> 
> Fixes:
>  - No autobuilder failures yet
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lvm2/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
