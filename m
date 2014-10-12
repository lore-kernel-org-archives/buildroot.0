From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 21:35:40 +0200
Subject: [Buildroot] [PATCH 6/8] package/tvheadend: Enable bundled build
In-Reply-To: <XnsA3C4CEF943036berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1413137610-21887-1-git-send-email-bernd.kuhls@t-online.de>
 <1413137610-21887-6-git-send-email-bernd.kuhls@t-online.de>
 <XnsA3C4CEF943036berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20141012213540.2e0ff685@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 12 Oct 2014 20:20:46 +0200, Bernd Kuhls wrote:

> the alternative is to remove host-python as a dependency and built  
> /usr/bin/tvheadend without its bundled webinterface, this will reduce build 
> time.
> 
> /usr/share/tvheadend, this is where the unbundled webinterface files are 
> stored, takes ~8 MB on the target, the bundled binary is ~3 MB bigger due to 
> the use of the Python gzip module when bundling the web files.
> 
> I leave this up for discussion ;)

Size-wise and simplicity-wise, the bundled option seems like the right
choice to me. If it doesn't suit someone in the future, it will always
be time to make it optional if needed.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
