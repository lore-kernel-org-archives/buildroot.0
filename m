From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Apr 2012 15:39:41 +0200
Subject: [Buildroot] where to commit a kernel modification?
In-Reply-To: <CAPEB33z4-PhKHiqw7WZohZ5kph_eieUN7v2QjCJ4SLn==JDOHg@mail.gmail.com>
References: <CAPEB33z4-PhKHiqw7WZohZ5kph_eieUN7v2QjCJ4SLn==JDOHg@mail.gmail.com>
Message-ID: <201204211539.42000.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday 18 April 2012 23:16:00 MERCADIER Johann wrote:
>   I would like to brings some modification to the kernel necessary to
> enable headset o/p to produce sound. Without it the twl6040 is not enabled
> as not registered when module is loaded. Where should I commit this?

 Obviously not here :-)

 Where to submit it to depends on where you're making changes.  There
is a script in the kernel source to help you:

./scripts/get_maintainer.pl <patchfile>

or

./scripts/get_maintainer.pl -f <sourcefile>


 Look carefully at the output and consider for each e-mail address if
it is really appropriate.  Common sense is important here.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
