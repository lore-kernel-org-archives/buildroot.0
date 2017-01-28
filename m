From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 28 Jan 2017 21:11:22 +1300
Subject: [Buildroot] [PATCH v2] valgrind: Force -fno-stack-protector in
 CFLAGS
In-Reply-To: <1482346936-25598-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1482346936-25598-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20170128211122.3991c6d8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Dec 2016 13:02:16 -0600, Matt Weber wrote:
> From: Brandon Maier <brandon.maier@rockwellcollins.com>
> 
> Valgrind must be compiled with no stack protection. Valgrind defaults
> CFLAGS to -fno-stack-protector, but Buildroot's CFLAGS may override
> if SSP is enabled.
> 
> Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
