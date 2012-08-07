From: enrico d'urso <e.durso@live.com>
Date: Tue, 7 Aug 2012 22:44:11 +0200
Subject: [Buildroot] [Login]
In-Reply-To: <CALR4fEKKaH8DL23oq_1AhKYqe1Hqm-O70aoCPNO+myq-XpR0gQ@mail.gmail.com>
References: <DUB116-W30E67467724AA1ADDB84AE97CE0@phx.gbl>,
 <CALR4fEKKaH8DL23oq_1AhKYqe1Hqm-O70aoCPNO+myq-XpR0gQ@mail.gmail.com>
Message-ID: <DUB116-W130B2FB8A44D39F38AFE93097CE0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,
In VirtualBox options If i create a serial port (raw) and set it to write output in a file , I can see
(in that file) this:
"Welcome to buildroot" 
"login:" 

I would ,that line above, were in stdoutput so I Could login!

(I'm Italian, sorry my bad english)

Thanks

Bye


From: diegoiast@gmail.com
Date: Tue, 7 Aug 2012 23:29:10 +0300
Subject: Re: [Buildroot] [Login]
To: e.durso at live.com
CC: buildroot at busybox.net

Do you see the login on the serial line...?
(Just reminder to self - I am seeing the same when I test on qemu... I need to route the serial as well...)

On Tue, Aug 7, 2012 at 8:26 PM, enrico d'urso <e.durso@live.com> wrote:






Hi ,

I'm tring to boot a kernel customize and buildroot initrd through VirtualBox,
My problem is that I can't login because doesn't appears : 
"Welcome to buildroot" 
The boot seems block to:


..Starting Network..
In my configuration there is:

ttys0 as ' port to getty'.

Thank you

Bye

enrico

 		 	   		  



_______________________________________________

buildroot mailing list

buildroot at busybox.net

http://lists.busybox.net/mailman/listinfo/buildroot

 		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120807/b8cf12d4/attachment.html>
