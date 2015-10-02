From: Markos Chandras <Markos.Chandras@imgtec.com>
Date: Fri, 2 Oct 2015 09:24:04 +0100
Subject: [Buildroot] [PATCH v3] libseccomp: Add new config option to
 build and install tests
In-Reply-To: <1442827716-8802-1-git-send-email-markos.chandras@imgtec.com>
References: <20150920144637.25230558@free-electrons.com>
 <1442827716-8802-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <560E3F24.90109@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/21/2015 10:28 AM, Markos Chandras wrote:
> Add new config option to allow building and installing the libseccomp
> testsuite on the target. It's useful for testing the kernels'
> seccomp behavior for the target architecture.
> 
> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>
> ---
> changes since v2:
> - Move installation path for tests to /usr/share/libseccomp
> - Do not install python files. We don't support python + libseccomp
> at the moment so there is no point in installing these tests yet.
> 
> changes since v1:
> - Drop compile hook for tests and use MAKE_OPTS instead
> ---

ping?

-- 
markos
