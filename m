From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Oct 2019 22:31:29 +0100
Subject: [Buildroot] [PATCH 1/5] boot/optee-os: bump version to 3.7.0
In-Reply-To: <f25cf981ca8a67c30ac2b994980a9f26aceb1dd2.1572355772.git.etienne.carriere@linaro.org>
References: <f25cf981ca8a67c30ac2b994980a9f26aceb1dd2.1572355772.git.etienne.carriere@linaro.org>
Message-ID: <6e0dc521-501a-083c-8832-c0c6855a5563@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/10/2019 15:41, Etienne Carriere wrote:
> Bump OP-TEE OS package version to OP-TEE release 3.7.0.
> 
> This adds host-python-pyelftools to optee-os dependencies
> 
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>

 Series applied to master, thanks.

 Just to be clear though: there is no version dependency between all these
packages? I.e., it is possible to run optee-examples 3.7.0 with optee-os 3.1.0?
(Barring bugs/regressions of course.)

 If there is a version dependency, then we'd have to get a version string from
the user if BR2_TARGET_OPTEE_OS_CUSTOM_GIT is used, and use that version for the
linux components.

 Regards,
 Arnout
