From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 06 Dec 2013 17:10:35 +0100
Subject: [Buildroot] Availability of old build results
In-Reply-To: <CAAXf6LWmaYb0cohOcbt5CdkXjMmeOFOLgbWN5eKQBqd66MCX5w@mail.gmail.com>
References: <20131206002526.58d095e8@skate> <20131205234122.GH3405@free.fr>
 <CAAXf6LVnoGgnwYNS+iqGdqpwdB+XoDC2Z0iCTKz2wxuKZbSYWA@mail.gmail.com>
 <874n6mfjsp.fsf@dell.be.48ers.dk> <20131206095043.361b3fc4@skate>
 <CAAXf6LWmaYb0cohOcbt5CdkXjMmeOFOLgbWN5eKQBqd66MCX5w@mail.gmail.com>
Message-ID: <52A1F6FB.1070101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/12/13 10:57, Thomas De Schampheleire wrote:
> If the patch is fixing an autobuild problem, we really should be
> repeating that autobuild configuration instead (but that could be done
> manually by someone).

  I think it would be nice if a failing autobuild configuration would 
automatically be added to jenkins, and that it would be automatically 
removed from there once it succeeds. Of course, that is only feasible if 
the number of failures is low (maximum 1 or 2 per day) and they get fixed 
quickly, otherwise jenkins will blow up. So it's not something we can 
consider right away.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
