From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Mar 2019 23:25:36 +0100
Subject: [Buildroot] [PATCH/next 2/9] package/optee-test: locate TA SDK
 though optee-os package
In-Reply-To: <283c62a3d5784f1b5635aa18a19a0e34940e692e.1551458062.git.etienne.carriere@linaro.org>
References: <e709b9364807ed93b5e1dc0edfe8a1dd50006b1b.1551458062.git.etienne.carriere@linaro.org>
 <283c62a3d5784f1b5635aa18a19a0e34940e692e.1551458062.git.etienne.carriere@linaro.org>
Message-ID: <20190305232536.31e72b89@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  1 Mar 2019 17:47:06 +0100
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> Package optee-os was recently changed to produce variable
> OPTEE_OS_STAGING_SDK to other packages to locate the OP-TEE Trusted
> Application SDK generated from optee-os package and installed in
> the Buildroot output staging directory.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---
>  package/optee-test/optee-test.mk | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)

Applied to master, after adjusting the commit log and the variable
name. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
