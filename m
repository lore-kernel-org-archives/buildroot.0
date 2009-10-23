From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 23 Oct 2009 18:54:56 +0200
Subject: [Buildroot] Autoconf still not building (M4 ) results
In-Reply-To: <87my3i1c3h.fsf@macbook.be.48ers.dk>
Message-ID: <5B7C7B17491E42A8A0888518184A7AD8@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi  


The logfile with ok suffix is the one run manually.

The PATH is diffferent when running through buildroot make compared with
manual run of ./configure with the same options.

I still have no explanation why this 'bug' does not show up on my debian
machine.

Johan

-----Oorspronkelijk bericht-----
Van: Peter Korsgaard [mailto:jacmet at gmail.com] Namens Peter Korsgaard
Verzonden: vrijdag 23 oktober 2009 15:20
Aan: Sagaert Johan
CC: buildroot at busybox.net
Onderwerp: Re: [Buildroot] Autoconf still not building (M4 )

>>>>> "Sagaert" == Sagaert Johan <sagaert.johan@skynet.be> writes:

Hi,
 
 Sagaert> Why is behaves this this differently ?

Strange. Try comparing the config.log files of the two runs and have a look
at the line numbers in configure that config.log refers to.

--
Bye, Peter Korsgaard
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config.log_bad
Type: application/octet-stream
Size: 5779 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091023/9a3054ef/attachment-0002.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config.log_ok
Type: application/octet-stream
Size: 8281 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091023/9a3054ef/attachment-0003.obj>
