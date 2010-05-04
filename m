From: Mike <mike-gmanemailinglistnospam@tiedyenetworks.com>
Date: Tue, 04 May 2010 07:51:27 -0700
Subject: [Buildroot] package selections vs openwrt
Message-ID: <hrpc9h$cha$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Howdy,

	I was just wondering if anyone had any comment on the size of the 
'feeds' available from OpenWRT vs Buildroot. It seems there's a lot more 
packages that have been pulled into that system (742 for feeds alone) 
even tho there's a common heritage, those have not been similarly pulled 
into buildroot and it's seems a bit duplicitous? Openwrt has a full on 
build of perl 5.10 for example, which appears to be a very hairy and 
non-trivial job to import as a buildroot project for example (but very 
desirable for me). On the other end of scale however many of those 
packages also appear to be old, insecure / known buggy versions. It 
would just be great for there to be some sort of import of those 
packages so at least they could be updated and used within the general 
buildroot system and not tailored just for the more narrow focused 
openwrt effort. I guess Im just wondering why there doesn't seem to be 
much overlap or cross project collaboration ?

Thanks.

Mike-
