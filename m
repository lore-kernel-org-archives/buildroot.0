From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Aug 2020 23:14:45 +0200
Subject: [Buildroot] [PATCH v3] libbacktrace: new package
In-Reply-To: <20200815091127.638233-1-avraham.shukron@gmail.com>
References: <20200815091127.638233-1-avraham.shukron@gmail.com>
Message-ID: <20200816231445.68cd5ac2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 15 Aug 2020 12:11:27 +0300
Avi Shukron <avraham.shukron@gmail.com> wrote:

> A C library that may be linked into a C/C++ program to produce
> symbolic backtraces.
> 
> Signed-off-by: Avi Shukron <avraham.shukron@gmail.com>
> ---
>  package/Config.in                      |  1 +
>  package/libbacktrace/Config.in         |  7 +++++++
>  package/libbacktrace/libbacktrace.hash |  3 +++
>  package/libbacktrace/libbacktrace.mk   | 15 +++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/libbacktrace/Config.in
>  create mode 100644 package/libbacktrace/libbacktrace.hash
>  create mode 100644 package/libbacktrace/libbacktrace.mk

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
