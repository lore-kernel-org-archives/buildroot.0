From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Sep 2020 08:42:29 +0200
Subject: [Buildroot] [PATCH v2,1/1] package/librsvg: fix license
In-Reply-To: <20200913204920.2713307-1-fontaine.fabrice@gmail.com>
References: <20200913204920.2713307-1-fontaine.fabrice@gmail.com>
Message-ID: <20200914084229.3a63fbae@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 13 Sep 2020 22:49:20 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Commit df20e4546384d1c249a6a0541183590671e83d77 forgot to update hash of
> COPYING.LIB which has been updated to use LGPL-2.1+ in version 2.47.0:
> https://github.com/GNOME/librsvg/commit/96b34f865dc8465d2ab93c7ae8344178b0ea7ed7
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/94fde5707a1104548c3386b628c92ebc9e034285
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Add link on autobuilder failure

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
