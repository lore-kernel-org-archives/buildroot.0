From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 4 Jun 2019 09:07:27 +0200
Subject: [Buildroot] [PATCH 1/1] package/libubootenv: needs threads
In-Reply-To: <20190603195926.3684-1-fontaine.fabrice@gmail.com>
References: <20190603195926.3684-1-fontaine.fabrice@gmail.com>
Message-ID: <20190604090727.36a7bd01@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  3 Jun 2019 21:59:26 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fixes:
>  - http://autobuild.buildroot.org/results/813e8951530c093f46b38bf8c3b467ab6535c95b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

From a very quick glance at the code and a quick build test, the
<pthread.h> include doesn't seem to be necessary. Perhaps it should
simply be removed ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
