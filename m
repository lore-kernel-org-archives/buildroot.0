From: Frank Hoeflich <frankhoeflich@yahoo.com>
Date: Sun, 24 May 2009 11:22:30 -0700 (PDT)
Subject: [Buildroot] hang generating DSA keys
Message-ID: <358556.29433.qm@web56902.mail.re3.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The entropy mechanism depends on keyboard input - I'd expect it to be waiting for I/O.? If you type some characters it will use them to generate the keys and be on its way.

--Frank

 
        	>Sunday, May 24, 2009 12:21 AM
        	
            
            
            >From: "Peter Korsgaard" <jacmet@uclibc.org>
            
            	
            	
            	
        	
        	>To: "Chris Bare" <chris@bareflix.com>
        	
        	>Cc: buildroot at lists.busybox.net
                >>>>> "Chris" == Chris Bare <chris@bareflix.com> writes:
>
>Chris> Generating DSA Key...
>Chris> THIS CAN TAKE A MINUTE OR TWO DEPENDING ON YOUR PROCESSOR!
>
>Chris> Generating public/private dsa key pair.
>
>Chris> I let it sit overnight and it never finished. I remember
>Chris> seeing some mention of this being an entropy problem. I tried
>Chris> pinging the board, but that didn't seem to help.
>
>Chris> Any idea why this would suddenly start with the same basic
>Chris> setup that worked before?? How do I get it to finish
>Chris> generating the key?
>
>Sounds odd - Could you add strace and check what it's busy doing?
>
>-- 
>Bye, Peter Korsgaard



      
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20090524/ebeab4d7/attachment.htm>
