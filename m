From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 21:54:38 +0100
Subject: [Buildroot] [PATCH v2 1/1] docs/manual: document format for
 specifying licenses
In-Reply-To: <1453698340-13777-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1453698340-13777-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160306215438.4d75baf0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Rahul Bedarkar,

On Mon, 25 Jan 2016 10:35:40 +0530, Rahul Bedarkar wrote:
> +  ** If the package is released under multiple licenses, then +comma+ separate

I found the wording "If the package is released under multiple
licenses" as potentially confusing, as it could be understood as the
dual licensing case. So I've changed that to:

+  ** If different parts of the package are released under different
+  licenses

Which I believe is clearer.

> +  licenses (e.g. +`LIBFOO_LICENSE = GPLv2+, LGPLv2.1+`+). If there is clear
> +  distinction between which component is licensed under what license, then
> +  annotate the license with that component
> +  (e.g. +`LIBFOO_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)`+).

I've explicited: "annonate the license with that component between
parenthesis".

And applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
