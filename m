From: Bernhard Fischer <rep.nop@aon.at>
Date: Thu, 9 Nov 2006 11:03:15 +0100
Subject: [Buildroot] Toolchain clean ? rebuild with extra patch
In-Reply-To: <loom.20061109T101231-410@post.gmane.org>
References: <loom.20061109T101231-410@post.gmane.org>
Message-ID: <20061109100315.GB29635@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Nov 09, 2006 at 09:18:01AM +0000, MikeW wrote:
>All of the toolchain-build contents persist after make clean, distclean,
>so which 'clean' variant should be used if you want to rebuild the toolchain ?

Try make dirclean.
