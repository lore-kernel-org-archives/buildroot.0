From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Mon, 10 Feb 2014 18:15:06 +0100
Subject: [Buildroot] custom kernel tarball does not use the path.
In-Reply-To: <d181bde1-9238-4bdc-bf2f-139e3d15746c@email.android.com>
References: <20945F1C02CA42F18AD8B241C4EEE215@JohanW7>
 <d181bde1-9238-4bdc-bf2f-139e3d15746c@email.android.com>
Message-ID: <D5029D5D4676497A8F830ED2869198B6@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 
Hi Thomas

-----Oorspronkelijk bericht-----
Van: Thomas De Schampheleire [mailto:patrickdepinguin at gmail.com] 
Verzonden: maandag 10 februari 2014 7:18
Aan: Sagaert Johan; buildroot at busybox.net
Onderwerp: Re: [Buildroot] custom kernel tarball does not use the path.

Hi Johan,

Sagaert Johan <sagaert.johan@skynet.be> schreef:
>  
>Hi
>
>In my config file I have the custom kernel path set to :
>
>$(TOPDIR)/board/karo/linux-3.13.0-RC7.tar.bz2

Can you show exactly how this is assigned in the .config file? Are you using file:// ?

> No just using $(TOPDIR)/board/karo/linux-3.13.0-RC7.tar.bz2
> I tried again by using the file:// prefixing the path. That works.
> I failed to use the file:// url spec.

Regards  Johan 


And did you already try 'make linux-dirclean' so as to force a new download? Buildroot should copy the file from the specified
location to the dl dir, and then extract from there...

Best regards,
Thomas
