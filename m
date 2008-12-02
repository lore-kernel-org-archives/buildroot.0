From: Tiago Maluta <maluta_tiago@yahoo.com.br>
Date: Tue, 2 Dec 2008 06:00:02 -0800 (PST)
Subject: [Buildroot] Problem with jffs2 image creation.
In-Reply-To: <4935304C.2050206@free.fr>
Message-ID: <359170.83269.qm@web50702.mail.re2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



-- 
> I am new to the list. I built a custom electronic board
> based on an 
> atmel AT91SAM9260 processor.
> I successfully finished a complete buildroot build, but I
> have a problem.
> The generated jffs2 image of the root filesystem is
> incorrect, in fact 
> the dev directory is not populated, thus I have this
> message after the 
> linux kernel has mounted the filesystem : "Unable to
> open an initial 
> console"
> 
> I tried the ext2 image in my board, it works correctly. But
> I absolutely 
> need to use jffs2 because my filesystem is in a Nand flash.
> 

You mean when you use an ext2 image (just changing from buildroot config) they create necessary files on /dev?

Send your config file.

--
Tiago Maluta.



      
