From: Jonathan Dumaresq <jdumaresq@cimeq.qc.ca>
Date: Thu, 17 Jan 2008 09:56:44 -0500
Subject: [Buildroot] Where to add/locate board support?
In-Reply-To: <478F6BA3.9000204@gmail.com>
References: <478F6BA3.9000204@gmail.com>
Message-ID: <01ab01c85919$2cdfd460$6e00a8c0@JONATHAN>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A small info can help you to do it. 

http://www.linux4sam.org/twiki/bin/view/Linux4SAM/BuildRoot

It's targeted for sam9 CPU, but the principle is the same. I'm in the same
boat of you. We have received our new custom board with the rm9200 and try
to get thing working in the right way. 

Regards

Jonathan

-----Message d'origine-----
De?: buildroot-bounces at uclibc.org [mailto:buildroot-bounces at uclibc.org] De
la part de Joe
Envoy??: 17 janvier 2008 09:52
??: buildroot at uclibc.org
Objet?: [Buildroot] Where to add/locate board support?

Hi all!

Currently i'm in the task of adding support for our custom board to 
buildroot, hence my question:
Where is the right place to add it? As we're using a RM9200 CPU, it 
could be located below target/devices/Atmel, for the folders in 
target/devices look to me more like CPUI vendors, not board vendors. Or 
should it got to target/devices/our_company_name/our_board_name?
But that would seem pretty oversized to me, for we're on really low 
production count, but i'd relly like to get things done right in the 
buildroot-way...

Thanks, Joe

-- 
Sepp "ZaP" Holzmayr

please reply to:
zentrale.at.work at gmail.com

watch out for:
www.rocksociety.de
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot
