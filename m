From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Apr 2017 14:36:20 +0200
Subject: [Buildroot] [PATCH v2 2/2] cmake: bump version to 3.8.0
In-Reply-To: <20170419122411.53340-2-Vincent.Riera@imgtec.com>
References: <20170419122411.53340-1-Vincent.Riera@imgtec.com>
 <20170419122411.53340-2-Vincent.Riera@imgtec.com>
Message-ID: <20170419143620.417bd7f3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Apr 2017 13:24:11 +0100, Vicente Olivert Riera wrote:
> cmake depends on librhash, but host-cmake doesn't. This is because we
> use the bundled dependencies for host-cmake but not for target.
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Thanks for this update. Did you test building a large number of
cmake-package packages of Buildroot with this new CMake version?

(Of course, to really test this, you need to uninstall your system-wide
CMake, or at least make Buildroot believe it's not
available/appropriate).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
