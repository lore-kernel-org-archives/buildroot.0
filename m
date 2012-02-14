From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 14 Feb 2012 17:07:52 +0100
Subject: [Buildroot] [git commit branch/next] Makefile: use
 /etc/os-release for version info rather than /etc/br-version
In-Reply-To: <20120214121000.DDC1090A9E@busybox.osuosl.org>
References: <20120214121000.DDC1090A9E@busybox.osuosl.org>
Message-ID: <4F3A86D8.5010605@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=451a887894faddef019e9a0628c21b5f2e9eee56
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next
>
> /etc/os-release is becoming a standard interface for distribution
> name/version info, so let's use that instead of the nonstandard
> /etc/br-version. Format of the file is something like:
>
> NAME=Buildroot
> VERSION=2012.02-rc1-00003-g2d10e81
> ID=buildroot
> VERSION_ID=2012.02-rc1
> PRETTY_NAME="Buildroot 2012.02-rc1"

Nice.
I just wish PRETTY_NAME had at least a "-dirty" suffix to make it
clear that it is not exactly equal to 2012.02-rc1 (at least when using
a git clone).

Luca
