From: Daniel Mack <daniel@zonque.org>
Date: Thu, 01 Dec 2011 20:21:43 +0100
Subject: [Buildroot] [PATCH 1/2] dbus: bump to version 1.5.8
In-Reply-To: <87borsgkyz.fsf@macbook.be.48ers.dk>
References: <1322758957-8248-1-git-send-email-zonque@gmail.com>
 <87borsgkyz.fsf@macbook.be.48ers.dk>
Message-ID: <4ED7D3C7.5040800@zonque.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/01/2011 08:17 PM, Peter Korsgaard wrote:
>>>>>> "Daniel" == Daniel Mack <zonque@gmail.com> writes:
> 
>  Daniel> Signed-off-by: Daniel Mack <zonque@gmail.com>
>  Daniel> ---
>  Daniel>  package/dbus/dbus.mk |    2 +-
>  Daniel>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
>  Daniel> diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
>  Daniel> index e18e291..3bff242 100644
>  Daniel> --- a/package/dbus/dbus.mk
>  Daniel> +++ b/package/dbus/dbus.mk
>  Daniel> @@ -3,7 +3,7 @@
>  Daniel>  # dbus
>  Daniel>  #
>  Daniel>  #############################################################
>  Daniel> -DBUS_VERSION = 1.4.16
>  Daniel> +DBUS_VERSION = 1.5.8
> 
> Isn't 1.5.x the unstable development series? Why would we want that in
> Buildroot?

Ah, I didn't see this. Right. That one isn't mandatory anyway, but the
dbus-glib update actually fixes some marshalling bug. I just though I'd
do the other update along the way :)


Thanks,
Daniel
