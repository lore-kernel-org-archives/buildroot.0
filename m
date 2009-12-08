From: Marc Egli <marc.egli@hsr.ch>
Date: Tue, 8 Dec 2009 11:25:18 +0100
Subject: [Buildroot] missing kernel headers when compiling kismet
In-Reply-To: <87r5r5on5c.fsf@macbook.be.48ers.dk>
References: <A208E45D-08AF-4294-ADEA-4734E3530DDC@hsr.ch>
	<87r5r5on5c.fsf@macbook.be.48ers.dk>
Message-ID: <0BEC155F-0AE3-43B6-B538-9C024D89964F@hsr.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

problem solved. 
i did make flush again and now it works. but i did this 2 times this morning and it didn't help. i hope it builds again if i do a make clean this night.

marc egli

Am 08.12.2009 um 10:01 schrieb Peter Korsgaard:

>>>>>> "Marc" == Marc Egli <marc.egli@hsr.ch> writes:
> 
> Marc> configuring kismet fails with the following message:
> Marc> checking for linux/wireless.h... (cached) no
> Marc> configure: error: Failed to find a usable linux/wireless.h header for Linux Wireless Extensions.  Either your kernel headers are missing or are incorrect.  See config.log for the exact error.  Compiling without wireless headers must be explicitly disabled
> Marc> make: *** [/emb/buildroot/output/build/kismet-2009-06-R1/.stamp_configured] Error 1
> 
> Hmm, it builds here - Please post your config. Notice that the above
> check has been cached, does it work if you run make flush; make?
> 
> -- 
> Bye, Peter Korsgaard
