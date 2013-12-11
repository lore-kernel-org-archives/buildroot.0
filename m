From: Sven Neumann <neumann@teufel.de>
Date: Wed, 11 Dec 2013 13:53:37 +0100
Subject: [Buildroot] [PATCH] wpa_supplicant: add option to enable syslog
 support
In-Reply-To: <20131211090518.GG1217@tarshish>
References: <1386751772-5704-1-git-send-email-neumann@teufel.de>
 <20131211090518.GG1217@tarshish>
Message-ID: <1386766417.2783.12.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mi, 2013-12-11 at 11:05 +0200, Baruch Siach wrote:
> Hi Sven,
> 
> On Wed, Dec 11, 2013 at 09:49:32AM +0100, Sven Neumann wrote:
> > Add an option to enable support for sending debug messages
> > to syslog instead of stdout.
> > 
> > Signed-off-by: Sven Neumann <neumann@teufel.de>
> > ---
> >  package/wpa_supplicant/wpa_supplicant.mk | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
> > index 4ae41c1..920f96a 100644
> > --- a/package/wpa_supplicant/wpa_supplicant.mk
> > +++ b/package/wpa_supplicant/wpa_supplicant.mk
> > @@ -116,6 +116,12 @@ endef
> >  
> >  endif
> >  
> > +ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_DEBUG_SYSLOG),y)
> 
> Where is this defined?

I am sorry, obviously the change to Config.in was not included in the
patch. Will resend.


Regards,
Sven
