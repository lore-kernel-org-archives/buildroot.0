From: Sven Eisenhauer <sven@sei.dyndns.org>
Date: Tue, 22 Dec 2009 17:14:14 +0100
Subject: [Buildroot] =?utf-8?q?BR2=5FARCH_for_Via_C3?=
Message-ID: <1ec03743bcd140dd21f82a816cf7ea4b@127.0.0.1>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

   

 Hello *,  

 I just started playing  around with buildroot (version 2009.11) to
get linux on a Via Epia board with C3 CPU.  

 So I just selected C3 processor with make menuconfig and the make
afterwards ran into an error.  

 I found out that BR2_ARCH is not set for BR2_x86_c3 in
targe/Config.in.arch.  

 After manually adding the line:  

 default "i586"          if BR2_x86_c3  
 the previous error disapeared.  

 Perhaps somebody forgot to add this config...  
 Cheers,  

 Sven     
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091222/6b92a36e/attachment.htm>
