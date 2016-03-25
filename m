From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Mar 2016 10:48:39 +0100
Subject: [Buildroot] [PATCH 1/2] package/qwt : prepared package for
 other versions of Qt.
In-Reply-To: <1458850791-4205-1-git-send-email-davepiq@yahoo.fr>
References: <1458850791-4205-1-git-send-email-davepiq@yahoo.fr>
Message-ID: <20160325104839.20bcbe13@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 24 Mar 2016 21:19:50 +0100, David Picard wrote:
> Reformatted the package configuration to make it more generic. It will thus be
> easier to handle more than one version of Qt. Indeed, multiple versions of Qt
> are compatible with the current Qwt. Dropped comment, considered uninformative.
> 
> Signed-off-by: David Picard <davepiq@yahoo.fr>
> ---
>  package/qwt/Config.in | 10 +++-------
>  package/qwt/qwt.mk    |  5 ++++-
>  2 files changed, 7 insertions(+), 8 deletions(-)

I've tweaked the commit log to explain a bit more that we are switching
to use "select" rather than "depends on" for the Qt sub-options, and
applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
