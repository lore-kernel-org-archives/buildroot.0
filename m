From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sat, 28 Feb 2015 10:46:56 +0100
Subject: [Buildroot] error in skeleton  ?
In-Reply-To: <87mw3yzeuu.fsf@dell.be.48ers.dk>
References: <F7D7D32518D04BB5BEB5B0B4D484022D@JohanW7>
 <87zj7zyqij.fsf@dell.be.48ers.dk> <33C946992B0B426D816DA8DF2CC39BD1@JohanW7>
 <87mw3yzeuu.fsf@dell.be.48ers.dk>
Message-ID: <59B2D366CCB24C38B692FB25823D5528@JohanW7>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 

-----Oorspronkelijk bericht-----
Van: buildroot [mailto:buildroot-bounces at busybox.net] Namens Peter Korsgaard
Verzonden: zaterdag 28 februari 2015 8:15
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] error in skeleton ?

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

Hi,

> Dear Peter;

 > Agreed, does not make sense to create directories in a mountpoint  > with devtmpfs.

 > Just wondering if the device_table.txt needs an entry for the /run  > directory introduced in 2015-02-rc1

Why would it need a device_table.txt entry? It is just a mount point and the skeleton already has the directory.

--
Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot


Peter 
Ok I understand that the special permissions for the /run directory
are determinated by the permissions of the mount point in the fstab file
and not by the orignal permissions of the mount point directory.

Best regards, johan
