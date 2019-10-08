From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 Oct 2019 22:54:38 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-pysnmp-apps: remove
 package
In-Reply-To: <20191008072801.3745-1-asafka7@gmail.com>
References: <20191008072801.3745-1-asafka7@gmail.com>
Message-ID: <20191008225438.7f3a4d63@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  8 Oct 2019 10:27:59 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> The package was renamed to snmpclient and is no longer maintained.
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
> ---
>  package/Config.in                                 |  1 -
>  package/python-pysnmp-apps/Config.in              | 12 ------------
>  .../python-pysnmp-apps/python-pysnmp-apps.hash    |  5 -----
>  package/python-pysnmp-apps/python-pysnmp-apps.mk  | 15 ---------------
>  4 files changed, 33 deletions(-)

You're missing the Config.in.legacy handling. The help text of the
Config.in.legacy entry should mention what is the replacement package,
and the legacy option should select it.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
