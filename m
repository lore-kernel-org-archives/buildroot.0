From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Apr 2014 15:41:07 +0200
Subject: [Buildroot] [PATCH] acpid: bump to version 2.0.22
In-Reply-To: <1398201933-6022-1-git-send-email-gustavo@zacarias.com.ar>
References: <1398201933-6022-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140423154107.533098a6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 22 Apr 2014 18:25:33 -0300, Gustavo Zacarias wrote:
> Switch to upstream sourceforge page/download.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>  package/acpid/Config.in                        |  2 ++
>  package/acpid/S02acpid                         |  4 ++--
>  package/acpid/acpid-01-dont-use-isfdtype.patch | 20 ++++++++++++++++++++
>  package/acpid/acpid.mk                         | 25 ++++++++++++-------------
>  4 files changed, 36 insertions(+), 15 deletions(-)
>  create mode 100644 package/acpid/acpid-01-dont-use-isfdtype.patch

Looks like some kernel headers issue is affecting the acpid build:
http://autobuild.buildroot.org/results/6d4/6d471942788fa05f324649ab15e6ca382e46df9c/build-end.log.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
