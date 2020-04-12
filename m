From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 16:00:32 +0200
Subject: [Buildroot] [PATCH 1/4] package/libbytesize: add new package
In-Reply-To: <20200217143030.5031-2-giulio.benetti@benettiengineering.com>
References: <20200217143030.5031-1-giulio.benetti@benettiengineering.com>
 <20200217143030.5031-2-giulio.benetti@benettiengineering.com>
Message-ID: <20200412160032.04aad473@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 17 Feb 2020 15:30:27 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Libbytesize is a tiny library providing a C "class" for working with
> arbitrary big sizes in bytes.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  DEVELOPERS                           |  1 +
>  package/Config.in                    |  1 +
>  package/libbytesize/Config.in        | 10 ++++++++++
>  package/libbytesize/libbytesize.hash |  3 +++
>  package/libbytesize/libbytesize.mk   | 15 +++++++++++++++
>  5 files changed, 30 insertions(+)
>  create mode 100644 package/libbytesize/Config.in
>  create mode 100644 package/libbytesize/libbytesize.hash
>  create mode 100644 package/libbytesize/libbytesize.mk

Because the rest of the series has been marked as Changes Requested due
to the feedback that was provided, I have also marked this particular
patch as Changes Requested. It doesn't make a whole lot of sense to
have this libbytesize library without the rest of the series.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
