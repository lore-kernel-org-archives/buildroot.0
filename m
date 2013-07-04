From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 04 Jul 2013 11:12:10 +0200
Subject: [Buildroot] [PATCH 23/23] docs/manual: update to mention eglibc
	support in Buildroot toolchain backend
In-Reply-To: <1372620553-11416-24-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 30 Jun 2013 21:29:13 +0200")
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1372620553-11416-24-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87zju2lmdx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  docs/manual/configure.txt | 52 +++++++++++++++++++++++------------------------
 Thomas>  1 file changed, 26 insertions(+), 26 deletions(-)

 Thomas> diff --git a/docs/manual/configure.txt b/docs/manual/configure.txt
 Thomas> index 4f9a6bb..e554ff8 100644
 Thomas> --- a/docs/manual/configure.txt
 Thomas> +++ b/docs/manual/configure.txt
 Thomas> @@ -72,11 +72,12 @@ The _internal toolchain backend_ is the backend where Buildroot builds
 Thomas>  by itself a cross-compilation toolchain, before building the userspace
 Thomas>  applications and libraries for your target embedded system.
 
 Thomas> -This backend is the historical backend of Buildroot, and is limited to
 Thomas> -the usage of the http://www.uclibc.org[uClibc C library] (i.e, the
 Thomas> -_glibc_ and _eglibc_ C libraries are not supported by this backend,
 Thomas> -see the _External toolchain backend_ and _Crosstool-NG toolchain
 Thomas> -backend_ for solutions to use either _glibc_ or _eglibc_).
 Thomas> +This backend is the historical backend of Buildroot, and has been
 Thomas> +limited for a long time to the usage of the
 Thomas> +http://www.uclibc.org[uClibc C library]. Support for the _eglibc_ C
 Thomas> +library has been added in 2013 and is at this point. considered

The '.' after point shouldn't be there.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
