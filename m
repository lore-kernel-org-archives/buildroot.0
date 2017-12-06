From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Dec 2017 23:48:47 +0100
Subject: [Buildroot] [PATCH 2/2] flann: Disable find package for HDF5
In-Reply-To: <20171206144753.3603-1-johan.oudinet@gmail.com>
References: <20171206144753.3603-1-johan.oudinet@gmail.com>
Message-ID: <20171206234847.586b565d@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  6 Dec 2017 15:47:53 +0100, Johan Oudinet wrote:
> The HDF5 package is used by flann for testing purpose only and is
> not part of buildroot packages. However, if present in the host, it will
> be used and trigger the unsafe header/library path used in
> cross-compilation error.
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> ---
>  package/flann/flann.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
