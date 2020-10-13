From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Oct 2020 13:32:42 +0200
Subject: [Buildroot] [PATCH v2,1/3] package/daq: fix parallel build
In-Reply-To: <20201012162000.2750557-1-fontaine.fabrice@gmail.com>
References: <20201012162000.2750557-1-fontaine.fabrice@gmail.com>
Message-ID: <20201013133242.6e93e649@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Mon, 12 Oct 2020 18:19:58 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/daq/0002-parallel-grammar.patch | 29 +++++++++++++++++++++++++
>  package/daq/daq.mk                      |  6 ++---
>  2 files changed, 31 insertions(+), 4 deletions(-)
>  create mode 100644 package/daq/0002-parallel-grammar.patch

Thanks, I have applied the series. However, you had not properly kept
the authorship of Bernd. Bernd indeed appeared as the first
Signed-off-by line, but he no longer appeared as the commit author,
which was not correct: the Author and first Signed-off-by line should
always match. I fixed that up when applying.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
