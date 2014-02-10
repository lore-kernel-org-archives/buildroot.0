From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 10 Feb 2014 07:17:57 +0100
Subject: [Buildroot] custom kernel tarball does not use the path.
In-Reply-To: <20945F1C02CA42F18AD8B241C4EEE215@JohanW7>
References: <20945F1C02CA42F18AD8B241C4EEE215@JohanW7>
Message-ID: <d181bde1-9238-4bdc-bf2f-139e3d15746c@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Johan,

Sagaert Johan <sagaert.johan@skynet.be> schreef:
>  
>Hi
>
>In my config file I have the custom kernel path set to :
>
>$(TOPDIR)/board/karo/linux-3.13.0-RC7.tar.bz2

Can you show exactly how this is assigned in the .config file? Are you using file:// ?

And did you already try 'make linux-dirclean' so as to force a new download? Buildroot should copy the file from the specified location to the dl dir, and then extract from there...

Best regards,
Thomas
