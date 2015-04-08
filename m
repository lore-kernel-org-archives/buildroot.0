From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Apr 2015 22:35:28 +0200
Subject: [Buildroot] [PATCH v2] package/thrift: add dependency on
 host-autoconf-archive
In-Reply-To: <1428524781-20093-1-git-send-email-romain.naour@openwide.fr>
References: <1428524781-20093-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20150408223528.3d5ba49d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Wed,  8 Apr 2015 22:26:21 +0200, Romain Naour wrote:
> The ax_cxx_compile_stdcxx_11 macro bundled in thrift package is
> brocken [1] and out of date.
> 
> Add autoconf-archive as dependency to use an updated version of this macro.
> 
> Since Thrift actually doesn't use that particular C++11 feature, add a
> patch to make C++11 support optional.
> 
> [1] https://savannah.gnu.org/patch/index.php?8287
> 
> Fixes:
> [thrift]
> http://autobuild.buildroot.net/results/21e/21e3fff1e0d714f94ac7e621289d1a59bc02a05f/build-end.log
> [host-thrift]
> http://autobuild.buildroot.net/results/b89/b89ffc2bff699eb10bb6abd92369a43d4900354d/build-end.log
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Thanks, applied!

If you have the time, it would be great to clean up our 5 patches
against thrift and submit them upstream.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
