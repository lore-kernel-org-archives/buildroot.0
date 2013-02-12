From: Jezz <jezz@sysmic.org>
Date: Tue, 12 Feb 2013 18:59:02 +0100
Subject: [Buildroot] [[PATCH v2]] strongswan: new package
In-Reply-To: <20130212122551.46e895b6@skate>
References: <20130208190247.7da881c9@skate>
 <1360667974-9734-2-git-send-email-jezz@sysmic.org>
 <20130212122551.46e895b6@skate>
Message-ID: <1696554.VhhAAgJSGv@sagittae>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 12 February 2013 12:25:51 Thomas Petazzoni wrote:
> Dear J?r?me Pouiller,
> 
> On Tue, 12 Feb 2013 12:19:33 +0100, J?r?me Pouiller wrote:
> > +config BR2_PACKAGE_STRONGSWAN_OPENSSL
> > +	bool "Enables OpenSSL based crypto backends"
> > +	select OPENSSL
> > +
> > +config BR2_PACKAGE_STRONGSWAN_GCRYPT
> > +	bool "Enables libgcrypt based crypto backends"
> > +	select LIBGCRYPT
> 
> "select OPENSSL" or "select LIBGCRYPT" definitely cannot work, we don't
> have such options in Buildroot.
Sure. 

hmm... Config cannot warn me about stupid errors like this?


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
