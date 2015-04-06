From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 23:29:17 +0200
Subject: [Buildroot] [PATCH 1/6 v3] support/download: do not warn about
 missing hash file for repositories
In-Reply-To: <129976edaa1c2da5422402ba25274706cc2d2d26.1428322317.git.yann.morin.1998@free.fr>
References: <cover.1428322317.git.yann.morin.1998@free.fr>
 <129976edaa1c2da5422402ba25274706cc2d2d26.1428322317.git.yann.morin.1998@free.fr>
Message-ID: <20150406232917.54ace7d8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon,  6 Apr 2015 14:13:06 +0200, Yann E. MORIN wrote:
> When downloading from a repository, we explicitly pass no hash file,
> because we can't check hashes in that case.
> 
> However, we're still printing a message that there is a missign hash
> file.
> 
> Beside being a bit annoying (since we can't do anything about it), it
> may also be wrong, especially for packages for which we support multiple
> versions, with some being downloaded via a git clone and others as
> tarballs.
> 
> Just print no warning when the path to the hash file is empty.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
