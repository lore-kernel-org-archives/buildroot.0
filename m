From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Feb 2019 11:35:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/zbar: bump to version
 681b0f305fb5c5bb0df8437f7d740b29a93a7889
In-Reply-To: <1549669614-19662-1-git-send-email-james.hilliard1@gmail.com>
References: <1549669614-19662-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <20190210113535.37fea28a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  9 Feb 2019 07:46:54 +0800
james.hilliard1 at gmail.com wrote:

> From: James Hilliard <james.hilliard1@gmail.com>
> 
> Zbar now has a dbus API which we should enable when dbus is present.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/zbar/zbar.hash | 2 +-
>  package/zbar/zbar.mk   | 9 ++++++++-
>  2 files changed, 9 insertions(+), 2 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
