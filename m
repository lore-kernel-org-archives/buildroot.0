From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 13 Jul 2015 01:37:40 +0200
Subject: [Buildroot] [PATCH 1/1] qt5base: add option for custom qconfig
 file
In-Reply-To: <1422970723-31706-1-git-send-email-will_wagner@carallon.com>
References: <1422970723-31706-1-git-send-email-will_wagner@carallon.com>
Message-ID: <20150713013740.58dc20f4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will,

On Tue,  3 Feb 2015 13:38:43 +0000, will_wagner at carallon.com wrote:
> From: Will Wagner <will_wagner@carallon.com>
> 
> Add in support for a custom qconfig file in the same way it is
> already present for the Qt4 package
> 
> Signed-off-by: Will Wagner <will_wagner@carallon.com>
> ---
>  package/qt5/qt5base/Config.in  |   13 +++++++++++++
>  package/qt5/qt5base/qt5base.mk |   13 +++++++++++++
>  2 files changed, 26 insertions(+)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
