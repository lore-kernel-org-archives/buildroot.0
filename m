From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 14 Feb 2015 09:01:11 +0100
Subject: [Buildroot] [PATCH] pkg-cmake: reduce output when being silent
In-Reply-To: <1423677141-10912-1-git-send-email-fabio.porcedda@gmail.com>
References: <1423677141-10912-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <20150214090111.67fcfffd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Fabio Porcedda,

On Wed, 11 Feb 2015 18:52:21 +0100, Fabio Porcedda wrote:
> Use CMAKE_RULE_MESSAGES and CMAKE_INSTALL_MESSAGE variables to reduce
> cmake output when it is a silent build.
> 
> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
> ---
>  package/pkg-cmake.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to next, after making the following changes:

    [Thomas:
     - use ifneq instead of ifdef
     - remove unneeded else clause
     - also add to the host variant of the configure commands]

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
