From: Ashish_Kumar_Mishra <dgashu55@gmail.com>
Date: Thu, 5 Jan 2017 00:46:15 -0800 (PST)
Subject: [Buildroot] Build Image goes to panic state with UBOOT-2016.09.01 [
 Observation ]
Message-ID: <1483605975276-153992.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to build an setup using the buildroot-2016.11.1 on Beagle bone
black  & getting panic. 

Debugging i could observe :-
ToolChain ( Linaro ARM 2016.05 ) + Kernel (4.8.11) + Uboot ( 2016.09.01 ) 
=> Panic 
ToolChain ( Linaro ARM 2016.05 ) + Kernel (4.6)      + Uboot ( 2016.09.01 )   
=> Panic  

If downgrade the Uboot to 2016.03 , the image boots properly. 

Since this is my first project could members please help me with :-
a) Has any other member observed the same ( this could help me understand
that i am not goofing any aspect at my end )
b) If yes then is this behaviour to be reported as an bug & whats the proper
way of doing it . 

Apologies if my query is not inline to forum rules , just want to understand
the game here so that slowly i can also be a contributing member here . The
details of steps i followed is discussed in separate thread at 
http://buildroot-busybox.2317881.n4.nabble.com/Kernel-Panic-with-BB-Black-buildroot-2016-11-1-td153942.html

Thanks...



--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Build-Image-goes-to-panic-state-with-UBOOT-2016-09-01-Observation-tp153992.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
