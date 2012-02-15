From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 Feb 2012 17:14:45 +0100
Subject: [Buildroot] [PATCH] lite: Fix pkg-config file by removing
	excess slashes.
In-Reply-To: <CAFbHwiQd02YFDDZ1pzQk=Yv2Zv_OM1aGz8ddb_p3neNOPUq7MQ@mail.gmail.com>
 (Will Newton's message of "Wed, 15 Feb 2012 15:56:42 +0000")
References: <CAFbHwiQd02YFDDZ1pzQk=Yv2Zv_OM1aGz8ddb_p3neNOPUq7MQ@mail.gmail.com>
Message-ID: <877gzot6oa.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Will" == Will Newton <will.newton@gmail.com> writes:

 Will> Signed-off-by: Will Newton <will.newton@imgtec.com>
 Will> ---
 Will>  package/lite/lite-pkg-config.patch |   11 +++++++++++
 Will>  1 files changed, 11 insertions(+), 0 deletions(-)
 Will>  create mode 100644 package/lite/lite-pkg-config.patch

 Will> diff --git a/package/lite/lite-pkg-config.patch
 Will> b/package/lite/lite-pkg-config.patch
 Will> new file mode 100644
 Will> index 0000000..5a6bea0
 Will> --- /dev/null
 Will> +++ b/package/lite/lite-pkg-config.patch
 Will> @@ -0,0 +1,11 @@
 Will> +Remove excess slashes from the .pc file. This change was made in
 Will> +the upstream git repo as 7982cccbb6ad58f3802bb266467290200d130a48.

Could you please then git format-patch that commit so we have the
original author/commit message?

-- 
Bye, Peter Korsgaard
