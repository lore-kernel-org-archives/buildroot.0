From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 16 Feb 2014 01:00:33 +0100
Subject: [Buildroot] Analysis of build failures
In-Reply-To: <20140214101241.27857b9e@skate>
References: <20140214073009.1D7E6102637@stock.ovh.net>
 <20140214101241.27857b9e@skate>
Message-ID: <52FFFFA1.7030109@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,
>>        i686 |            imagemagick-6.8.8-4 | NOK | http://autobuild.buildroot.net/results/a9d35975c7699515350eb307712cd69b6d48e418/
> Not enough backlog to see what the error is, unfortunately.
>
>
It is impossible to disable documentation in Imagemagick because all 
options like  --disable-gtk-doc, --disable-doc, --disable-docs and 
--disable-documentation are not handled by configure script.

It will be easier to understand what happens when the build fails if we 
remove hard coded documentation from Makefiles.

I just sent a patch for this.

Best regards,
Romain Naour
