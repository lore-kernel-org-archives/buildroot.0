From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 4 Mar 2012 16:20:53 +0100
Subject: [Buildroot] core dependencies : xzcat
In-Reply-To: <F61A9C053A5D4AF8913833CBFF49CED7@JohanW7>
References: <F61A9C053A5D4AF8913833CBFF49CED7@JohanW7>
Message-ID: <201203041620.54147.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 04 March 2012 14:45:06 Sagaert Johan wrote:
> While package sourcecode is downloaded automatically , for the core dependencies you are on your own.
>  
> Would be nice if the readme would contain a list of download sites for the core dependencies, or even better download them, 
> it would of saved me 10 minutes of my life 

 I agree.  For many dependencies, we even have the host-packages already 
available (e.g. ncurses).

 With the check-host-x infrastructure in place, it should be easier to
resolve dependencies automatically.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
