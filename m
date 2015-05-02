From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 02 May 2015 22:45:04 +0200
Subject: [Buildroot] Libtool problem building mesa3d-demos
In-Reply-To: <CAD7j7Q9-bJDVNo7yfOowfuiD6X=KTPjTwvGtznoenG8c2Hzqxg@mail.gmail.com>
References: <CAD7j7Q96pGF1qedawQw4-FHSyC15EyXH1DBu=MNkvFQg_Ys-dg@mail.gmail.com>	<5543FACD.4010307@mind.be>	<CAD7j7Q-9n+y-38sHk+ESnOkr4rBnRAQ8tvt5fMC=_f7J-0wkHA@mail.gmail.com>	<55452348.7030306@mind.be>
 <CAD7j7Q9-bJDVNo7yfOowfuiD6X=KTPjTwvGtznoenG8c2Hzqxg@mail.gmail.com>
Message-ID: <55453750.9080302@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/05/15 22:42, Carlos Soto wrote:
> 
>      Since this xtools thing is not passed on the command line, it must be in your
>     environment. Can you do 'env | grep xtools'?
> 
>      Regards,
>      Arnout
> 
> No, it's not in my environment. As far as I can tell, libtool seems to be
> joining together my toolchain path
> (usr/local/xtools//arm-cortexa9_neon-linux-gnueabihf) and the buildroot staging
> sysroot path (
> /home/starsl/iMX6/buildroot/output/host/usr/lib)

 OK, so then there must be some .la file which has something funny. Can you grep
for xtools in all the .la files in output/ ?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
