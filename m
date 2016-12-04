From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 16:21:26 +0100
Subject: [Buildroot] [PATCH 1/6] package/aubio: new package
In-Reply-To: <1480767459-17230-1-git-send-email-romain.naour@gmail.com>
References: <1480767459-17230-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20161204162126.3eebf699@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Dec 2016 13:17:34 +0100, Romain Naour wrote:
> Aubio attempt to build aubio.so shared library so disable it for static
> build only.
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/Config.in                         |  1 +
>  package/aubio/0001-remove-unit-test.patch | 63 +++++++++++++++++++++++++++++++
>  package/aubio/Config.in                   | 21 +++++++++++
>  package/aubio/aubio.hash                  |  2 +
>  package/aubio/aubio.mk                    | 24 ++++++++++++
>  5 files changed, 111 insertions(+)
>  create mode 100644 package/aubio/0001-remove-unit-test.patch
>  create mode 100644 package/aubio/Config.in
>  create mode 100644 package/aubio/aubio.hash
>  create mode 100644 package/aubio/aubio.mk

Applied to master, thanks. Could you please talk with upstream about
the issue with the unit test, so that it can be solved? Adding an
option to enable/disable tests would be good, for example.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
