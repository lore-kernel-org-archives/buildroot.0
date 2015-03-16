From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Mar 2015 22:17:00 +0100
Subject: [Buildroot] [PATCH 3/4] toolchainfile.cmake: only search the
 sysroot for CMake module
In-Reply-To: <1425808043-32292-4-git-send-email-s.martin49@gmail.com>
References: <1425808043-32292-1-git-send-email-s.martin49@gmail.com>
 <1425808043-32292-4-git-send-email-s.martin49@gmail.com>
Message-ID: <20150316221700.4558010b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Sun,  8 Mar 2015 10:47:22 +0100, Samuel Martin wrote:
> This change prevents CMake from searching outside the sysroot location
> for CMake modules when cross-compiling.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
