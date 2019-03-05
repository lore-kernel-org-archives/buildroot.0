From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 5 Mar 2019 23:25:59 +0100
Subject: [Buildroot] [PATCH/next 3/9] package/optee-examples: locate TA
 SDK though optee-os package
In-Reply-To: <7b26af8b76a3c9e67ac6ce6b1c48a683641e98a4.1551458062.git.etienne.carriere@linaro.org>
References: <e709b9364807ed93b5e1dc0edfe8a1dd50006b1b.1551458062.git.etienne.carriere@linaro.org>
 <7b26af8b76a3c9e67ac6ce6b1c48a683641e98a4.1551458062.git.etienne.carriere@linaro.org>
Message-ID: <20190305232559.37331b63@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri,  1 Mar 2019 17:47:07 +0100
Etienne Carriere <etienne.carriere@linaro.org> wrote:

> Package optee-os was recently changed to produce variable
> OPTEE_OS_STAGING_SDK to other packages to locate the OP-TEE Trusted
> Application SDK generated from optee-os package and installed in
> the Buildroot output staging directory.
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---
>  package/optee-examples/optee-examples.mk | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)

Applied to master after adjusting the variable name and commit log.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
