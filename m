From: Geoff Levand <geoff@infradead.org>
Date: Mon, 30 Jul 2018 07:46:08 -0700
Subject: [Buildroot] [PATCH v1] dtc: Add set-ldshared.patch
In-Reply-To: <20180728154329.0bafffec@windsurf>
References: <28d7fee033a5e5ef512c02d5291d20b1d19fdbbf.1532460521.git.geoff@infradead.org>
 <20180727110728.300c06e2@windsurf>
 <f1e71e0d-6728-78d1-0431-c1e2846ab885@infradead.org>
 <20180728145647.70ac1d52@windsurf> <20180728154329.0bafffec@windsurf>
Message-ID: <7dd4e047-43b8-8bfc-2710-9c804b09d003@infradead.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/28/2018 06:43 AM, Thomas Petazzoni wrote:
> I applied a simpler fix: pass
> NO_PYTHON=1 so that we don't build the Python support, even if the
> necessary dependencies are found.

OK, great.  Thanks for looking into it.

-Geoff
