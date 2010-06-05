From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Sat, 05 Jun 2010 21:50:24 +0200
Subject: [Buildroot] [PATCH 3/4] gstreamer: drop BR2_USE_WCHAR
 dependency (already required by libglib2)
In-Reply-To: <20100605213149.59aa8a5a@surf>
References: <1275761030-20955-1-git-send-email-llandwerlin@gmail.com>
	<1275761030-20955-4-git-send-email-llandwerlin@gmail.com>
	<20100605213149.59aa8a5a@surf>
Message-ID: <1275767424.9566.30.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le samedi 05 juin 2010 ? 21:31 +0200, Thomas Petazzoni a ?crit :
> On Sat,  5 Jun 2010 20:03:49 +0200
> llandwerlin at gmail.com wrote:
> 
> > -	depends on BR2_USE_WCHAR # glib2
> 
> Why ? All packages that depend on libglib2 and therefore on gettext
> should depend on BR2_USE_WCHAR. See
> b730010c90a127746bada3d537eb0e204cba5988.
> 
> Is this dependency causing any problems ?
> 
> Thomas

Hi Thomas,

I don't understand why gstreamer should depend on BR2_USE_WCHAR and
BR2_PACKAGE_LIBGLIB2 if libglib2 already depends on BR2_USE_WCHAR.
It sounds like a repetition to me, isn't it ?

Regards,

-- 
Lionel Landwerlin
