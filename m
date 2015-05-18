From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 May 2015 21:55:58 +0200
Subject: [Buildroot] [PATCH v2 2/6] pkg-utils: implement INFLATE for
 .deb files
In-Reply-To: <1431959088-15257-3-git-send-email-guido@vanguardiasur.com.ar>
References: <1431959088-15257-1-git-send-email-guido@vanguardiasur.com.ar>
 <1431959088-15257-3-git-send-email-guido@vanguardiasur.com.ar>
Message-ID: <20150518215558.0cde581c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Guido Mart?nez,

On Mon, 18 May 2015 11:24:44 -0300, Guido Mart?nez wrote:

> +ar fp ${DEBFILE} data.tar.xz | ${XZCAT} -d

Are all Debian .deb packages compressed with the xz compression? How
many packages would benefit for this being supported at the package
infra level vs. handling it directly in the toolchain-external package?

We normally try to not clutter the package infra with features only
useful to one package, especially when the feature can easily be
implemented at the package level.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
