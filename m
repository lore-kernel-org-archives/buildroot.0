From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri, 22 Nov 2013 08:41:52 +0100
Subject: [Buildroot] [PATCH] libglib2: needs MMU support
In-Reply-To: <8a49d754da4819064a09.1384968585@argentina>
References: <8a49d754da4819064a09.1384968585@argentina>
Message-ID: <CAAXf6LVJBWOOKEs4DJ_k+m+th32jR-2n9MiY1St0dU4yGFPM4g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 20, 2013 at 6:29 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> Fixes http://autobuild.buildroot.net/results/2e0/2e032c6e44e10f2912935715741c3680a19b9b51/
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---
>  package/atk/Config.in                   |   2 ++
>  package/bluez_utils/Config.in           |   2 +-
>  package/bustle/Config.in                |   2 ++
>  package/connman/Config.in               |   2 +-
>  package/curlftpfs/Config.in             |   2 +-
>  package/dbus-glib/Config.in             |   2 ++
>  package/docker/Config.in                |   2 ++
>  package/enchant/Config.in               |   2 ++
>  package/gamin/Config.in                 |   2 ++
>  package/gdk-pixbuf/Config.in            |   2 ++
>  package/glib-networking/Config.in       |   2 ++
>  package/glibmm/Config.in                |   2 ++
>  package/gmpc/Config.in                  |   2 ++
>  package/gob2/Config.in                  |   3 +--
>  package/gstreamer/gstreamer/Config.in   |   2 ++
>  package/gstreamer1/gstreamer1/Config.in |   2 ++
>  package/gvfs/Config.in                  |   2 +-
>  package/json-glib/Config.in             |   2 ++
>  package/latencytop/Config.in            |   2 ++
>  package/libglade/Config.in              |   2 ++
>  package/libglib2/Config.in              |   2 ++
>  package/libgtk2/Config.in               |   2 ++
>  package/libmms/Config.in                |   2 ++
>  package/libmpd/Config.in                |   2 ++
>  package/libqmi/Config.in                |   2 ++
>  package/librsvg/Config.in               |   2 ++
>  package/libsecret/Config.in             |   2 ++
>  package/libsoup/Config.in               |   2 ++
>  package/lttng-babeltrace/Config.in      |  11 +++++------
>  package/mpd/Config.in                   |   2 ++
>  package/nbd/Config.in                   |   2 ++
>  package/neard/Config.in                 |   2 +-
>  package/ofono/Config.in                 |   2 +-
>  package/pango/Config.in                 |   2 ++
>  package/pkg-config/Config.in            |   2 ++
>  package/polkit/Config.in                |   2 ++
>  package/shared-mime-info/Config.in      |   2 ++
>  package/sshfs/Config.in                 |   2 +-
>  package/sysprof/Config.in               |   2 ++
>  package/udev/Config.in                  |   2 ++
>  package/vala/Config.in                  |   2 ++
>  package/wireshark/Config.in             |   2 +-
>  42 files changed, 78 insertions(+), 16 deletions(-)


ping on this patch?
