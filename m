From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 23:23:01 +0200
Subject: [Buildroot] [PATCH v3] package/aubio: bump to version 0.4.5
In-Reply-To: <20170417173322.19328-1-romain.naour@gmail.com>
References: <20170417173322.19328-1-romain.naour@gmail.com>
Message-ID: <20170504232301.4c0a603f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Apr 2017 19:33:22 +0200, Romain Naour wrote:
> Since aubio 0.4.4, the libsamplerate support require fftw
> single precision mode [1].
> 
> [1] https://github.com/aubio/aubio/commit/8be88e77f5c275fdf4efc99ae182d14940948786
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
> v3: simply the libsamplerate dependency (ThomasP).
> v2: fix aubio version in the commit log.
> ---
>  package/aubio/aubio.hash | 4 ++--
>  package/aubio/aubio.mk   | 5 +++--
>  2 files changed, 5 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
