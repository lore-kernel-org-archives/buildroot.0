From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 May 2017 20:34:52 +0200
Subject: [Buildroot] [PATCH 1/1] lxc: set libcap as an optional
 dependency
In-Reply-To: <1495203359-57057-1-git-send-email-fontaine.fabrice@gmail.com>
References: <1495203359-57057-1-git-send-email-fontaine.fabrice@gmail.com>
Message-ID: <20170521203452.784787e6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 19 May 2017 16:15:59 +0200, Fabrice Fontaine wrote:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/lxc/Config.in |  1 -
>  package/lxc/lxc.hash  |  1 +
>  package/lxc/lxc.mk    | 13 ++++++++++++-
>  3 files changed, 13 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
