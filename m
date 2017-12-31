From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Dec 2017 17:29:58 +0100
Subject: [Buildroot] [PATCH] curlpp: new package
In-Reply-To: <1514721304-12634-1-git-send-email-sergio.prado@e-labworks.com>
References: <1514721304-12634-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20171231172958.527ddbe1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 31 Dec 2017 09:55:04 -0200, Sergio Prado wrote:

> +# Locally computed:
> +sha256 97e3819bdcffc3e4047b6ac57ca14e04af85380bd93afe314bee9dd5c7f46a0a  v0.8.1.tar.gz

What an annoying tarball name :-/ It's going to conflict with any other
package using the same name.

But well, we don't have a good solution to work-around this at the
moment. The mid-term solution is to move to one sub-folder per-package
in DL_DIR.

Anyway, I've applied your patch. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
