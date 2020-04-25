From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 22:19:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/paho-mqtt-c: disable tests and
 cpack docs
In-Reply-To: <20200425195608.9627-1-danomimanchego123@gmail.com>
References: <20200425195608.9627-1-danomimanchego123@gmail.com>
Message-ID: <20200425221909.246f18a6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 25 Apr 2020 15:56:08 -0400
Danomi Manchego <danomimanchego123@gmail.com> wrote:

> paho-mqtt-c by default enables the building of test materials and
> install of CPack documentation:
> 
> PAHO_ENABLE_TESTING - "Build tests and run"
> PAHO_ENABLE_CPACK - "Enable CPack"
> 
> Let's disable these to save a couple megabytes and time.  This is
> in keeping with the generic settings in pkg-cmake.mk.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
> ---
>  package/paho-mqtt-c/paho-mqtt-c.mk | 2 ++
>  1 file changed, 2 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
