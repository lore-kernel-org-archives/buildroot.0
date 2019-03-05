From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Mar 2019 23:25:12 +0100
Subject: [Buildroot] [PATCH/next 1/9] boot/optee-os: package sets TA SDK
 location
In-Reply-To: <e709b9364807ed93b5e1dc0edfe8a1dd50006b1b.1551458062.git.etienne.carriere@linaro.org>
References: <e709b9364807ed93b5e1dc0edfe8a1dd50006b1b.1551458062.git.etienne.carriere@linaro.org>
Message-ID: <20190305232512.15f77cdf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  1 Mar 2019 17:47:05 +0100
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> Makefile script for boot package optee-os produces make variable
> OPTEE_OS_STAGING_SDK to locate the Trusted Application SDK expected
> by other packages when building OP-TEE trusted applications.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---
>  boot/optee-os/optee-os.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

I changed the variable name to be just OPTEE_OS_SDK, and applied after
adjusting the commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
