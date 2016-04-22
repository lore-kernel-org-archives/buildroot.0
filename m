From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 22 Apr 2016 13:27:18 +0200
Subject: [Buildroot] [PATCH] python-backports-ssl-match-hostname: new
 package
In-Reply-To: <CAGm1_kuVRwS0dFNvHSR2FhKoESyi02ddK9Wkz_fCx6fv=DZzzA@mail.gmail.com>
References: <1461144174-7711-1-git-send-email-yegorslists@googlemail.com>
 <57192BD1.8090409@mind.be>
 <CAGm1_kuBn=tsBbb-BAczkdctQ=ecsZROyRJgJgBPHcWxJkfqJA@mail.gmail.com>
 <57195CFA.8060005@mind.be>
 <CAGm1_kuVRwS0dFNvHSR2FhKoESyi02ddK9Wkz_fCx6fv=DZzzA@mail.gmail.com>
Message-ID: <571A0A96.20003@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/22/16 12:48, Yegor Yefremov wrote:
> My suggestion is to enable
> BR2_PACKAGE_PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME for Python2 only and
> enable both it and certify when selecting tornado. What do you think
> about this?

  Sounds good to me. Do add an explanatory comment why these two additional 
packages are required, because the casual reader will not understand.

  Regards,
  Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
