From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Jan 2016 14:10:37 +0100
Subject: [Buildroot] [PATCH 1/1] ejabberd: Bump to version 15.11
In-Reply-To: <1452529575-21493-1-git-send-email-johan.oudinet@gmail.com>
References: <1452529575-21493-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20160116141037.62162386@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Johan Oudinet,

On Mon, 11 Jan 2016 17:26:15 +0100, Johan Oudinet wrote:
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
> ---
>  package/ejabberd/0002-disable-rebar-deps.patch     | 62 +++++++++++-----------
>  .../ejabberd/0007-fix-install-permissions.patch    | 26 ++++-----
>  package/ejabberd/0008-fix-ejabberdctl.patch        | 14 +++--
>  package/ejabberd/ejabberd.hash                     |  6 +--
>  package/ejabberd/ejabberd.mk                       |  2 +-
>  5 files changed, 55 insertions(+), 55 deletions(-)

Applied, thanks. We have 8 patches on ejabberd, it would be good if you
could submit them upstream, in order to be able to hopefully drop them
from Buildroot at some point in the future.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
