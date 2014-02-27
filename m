From: Sven Neumann <neumann@teufel.de>
Date: Thu, 27 Feb 2014 14:30:20 +0100
Subject: [Buildroot] [PATCH] libarchive: fix download location
In-Reply-To: <87ppm8adxa.fsf@dell.be.48ers.dk>
References: <1393506395-15064-1-git-send-email-neumann@teufel.de>
 <87ppm8adxa.fsf@dell.be.48ers.dk>
Message-ID: <1393507820.7963.17.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Do, 2014-02-27 at 14:22 +0100, Peter Korsgaard wrote:
> >>>>> "Sven" == Sven Neumann <neumann@teufel.de> writes:
> 
>  > Signed-off-by: Sven Neumann <neumann@teufel.de>
> 
>  > ---
>  >  package/libarchive/libarchive.mk | 2 +-
>  >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
>  > diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
>  > index 44d9cd2..0b8713f 100644
>  > --- a/package/libarchive/libarchive.mk
>  > +++ b/package/libarchive/libarchive.mk
>  > @@ -5,7 +5,7 @@
>  >  ################################################################################
>  
>  >  LIBARCHIVE_VERSION = 3.0.4
>  > -LIBARCHIVE_SITE = http://github.com/downloads/libarchive/libarchive
>  > +LIBARCHIVE_SITE = http://www.libarchive.org/downloads/
> 
> Fix in what way? The github URL seems to work for me:
> 
> wget http://github.com/downloads/libarchive/libarchive/libarchive-3.0.4.tar.gz

Hmm, I tried to look at
http://github.com/downloads/libarchive/libarchive/ which didn't work.

Sorry for the noise then.


Regards,
Sven

-- 
Sven Neumann
Senior System Architect

Lautsprecher Teufel GmbH
Gewerbehof B?lowbogen, Aufgang D1
B?lowstr. 66
10783 Berlin
Germany

Direkt   +49 (0) 30 / 300 930-153
Telefon  +49 (0) 30 / 300 930-0

neumann at teufel.de

Registernummer HRB 20271 beim Amtsgericht Berlin-Charlottenburg
Gesch?ftsf?hrer: J?rgen Schneider, Edgar van Velzen
Umsatzsteuer-ID: DE136745959

www.teufel.de - www.teufelaudio.com - www.raumfeld.com
