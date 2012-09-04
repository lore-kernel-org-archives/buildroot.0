From: Sven Neumann <s.neumann@raumfeld.com>
Date: Tue, 04 Sep 2012 15:38:25 +0200
Subject: [Buildroot] [PATCH] wpa-supplicant: add options to enable the
 new DBus interface
In-Reply-To: <1342644753-10038-1-git-send-email-s.neumann@raumfeld.com>
References: <1342644753-10038-1-git-send-email-s.neumann@raumfeld.com>
Message-ID: <1346765905.32192.3.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 2012-07-18 at 22:52 +0200, Sven Neumann wrote:
> Allow to configure the DBus interfaces that the wpa_supplicant
> binary should support (old or new or both). Also allow to
> enable introspection support on the new DBus interface.
> 
> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
> ---
>  package/wpa_supplicant/Config.in         |   19 ++++++++++++++
>  package/wpa_supplicant/wpa_supplicant.mk |   42 ++++++++++++++++++++++++++----
>  2 files changed, 56 insertions(+), 5 deletions(-)

Did this patch just miss your attention or is there anything wrong with
it?


Regards,
Sven
