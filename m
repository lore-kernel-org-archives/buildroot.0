From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 2 May 2018 22:30:48 +0200
Subject: [Buildroot] [PATCH v4 10/11] gst1-plugins-base: remove never
 set BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_WAYLAND
In-Reply-To: <CAFSsvmoHT6DsLvVFGHOH2kps9NrLUftJ-Gf9ZVKmjGEaes7MqQ@mail.gmail.com>
References: <20180412204543.25535-1-ps.report@gmx.net>
 <20180412204543.25535-3-ps.report@gmx.net>
 <CAFSsvmoHT6DsLvVFGHOH2kps9NrLUftJ-Gf9ZVKmjGEaes7MqQ@mail.gmail.com>
Message-ID: <20180502223048.7f588908@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Adam,

On Tue, 01 May 2018 12:38:36 +0000, Adam Duskett <aduskett@gmail.com> wrote:

> Peter, all;
> 
> On Thu, Apr 12, 2018 at 4:45 PM Peter Seiderer <ps.report@gmx.net> wrote:
> 
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >   package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 2 +-
> >   1 file changed, 1 insertion(01575fa6cc50bad5b5150f20dfed994e5d294f57+), 1 deletion(-)  
> 
> > diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk  
> b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> > index 71ea964e09..0edc757484 100644
> > --- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> > +++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
> > @@ -68,7 +68,7 @@ else
> >   GST1_PLUGINS_BASE_CONF_OPTS += --disable-x11
> >   endif  
> 
> > -ifneq  
> ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_WAYLAND)$(BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_WAYLAND),)
> > +ifneq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_WAYLAND),)
> >   GST1_PLUGINS_BASE_CONF_OPTS += --enable-wayland
> >   GST1_PLUGINS_BASE_DEPENDENCIES += wayland wayland-protocols
> >   else
> > --
> > 2.16.3  
> This looks good, and I really appreciate you taking the time to make these
> patches.
> Do you want me to re-submit my patch series with these patches? Or do you
> want to merge my series in with these patches last?

Feel free to merge the provided patches into your patch series (as
already done ;-) )...

Regards,
Peter

> 
> Thanks!
> 
> Adam
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
