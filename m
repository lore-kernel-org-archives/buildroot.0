From: Jeremy R. Geeo <jeremy@geeo.net>
Date: Wed, 15 Nov 2006 08:29:35 -0600
Subject: [Buildroot] Configure buildroot to provide /sbin/init (link to
 busybox?)
In-Reply-To: <loom.20061113T172233-107@post.gmane.org>
References: <loom.20061113T172233-107@post.gmane.org>
Message-ID: <455B244F.30107@geeo.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MikeW wrote:
> Should there be (is there !) a menuconfig way for buildroot to provide
> a /sbin/init entry in the filesystem ?
> If you don't specify 'init=...' at boot time, the kernel complains
> about 'no init'.
>   

Are you selecting the "Install symlinks for BusyBox applets" in the 
BusyBox section of your package selection?? It should be putting that 
link in for you.


Jeremy R. Geeo


> Regards,
> Mike
>
>   
