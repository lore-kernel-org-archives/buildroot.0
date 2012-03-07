From: Luca Ceresoli <luca.ceresoli@comelit.it>
Date: Wed, 07 Mar 2012 10:56:02 +0100
Subject: [Buildroot] [git commit] gpsd: dbus interface requires dbus-glib
In-Reply-To: <20120306223952.6291190D16@busybox.osuosl.org>
References: <20120306223952.6291190D16@busybox.osuosl.org>
Message-ID: <4F5730B2.3090302@comelit.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=b5410b6a19db7ef75af8df2fa5659c539ad37c47
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> gpsd uses dbus-glib as the dbus interface, so it should only be built if
> libglib2 has been selected.  To simplify things, build dbus support only
> if dbus-glib is selected.
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
> Signed-off-by: Peter Korsgaard<jacmet@sunsite.dk>
> ---
>   package/gpsd/Config.in |    2 ++
>   package/gpsd/gpsd.mk   |    4 ++--
>   2 files changed, 4 insertions(+), 2 deletions(-)
>
> Patch is too large, so refusing to show it

Wow.
This is really weird for a 6-line patch. But it did not happen in subsequent
commits, so it's probably a random spot?

Luca


--------------------------------------------------------------------------
Luca Ceresoli
Comelit R&D - Progettazione Software

COMELIT??
?
?
Phone???????
Fax??????????
Mail?????????luca.ceresoli at comelit.it
Web????????http://www.comelitgroup.com/
YouTube??http://www.youtube.com/comelitgroup
Prima di stampare pensa all'ambiente / Think about environment before printing
AVVISO DI CONFIDENZIALIT?
Questo messaggio ed i suoi eventuali allegati pu? contenere informazioni confidenziali, di propriet?, legalmente protette.? destinato all'utilizzo esclusivo del destinatario sopra indicato; privatezza e confidenzialit? non sono modificati da eventuali errori di trasmissione. Se il messaggio non ? a lei destinato, non deve utilizzarlo, diffonderlo, copiarlo con qualunque mezzo, o intraprendere azioni basandosi su di esso. Se ha ricevuto questo messaggio per errore, la preghiamo di volerlo distruggere (unitamente ad eventuali copie dello stesso) e di volerci cortesemente informare del fatto scrivendo al mittente.
CONFIDENTIALITY NOTICE
This message and its attachments (if any) may contain confidential, proprietary or legally privileged information and it is intended only for the use of the addressee named above. No confidentiality or privilege is waived or lost by any erroneous transmission. If you are not the intended recipient of this message you are hereby notified that you must not use, disseminate, copy it in any form or take any action in reliance on it. If you have received this message in error, please, delete it (and any copies of it) and kindly inform the sender.
