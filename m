From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 03 Sep 2012 09:48:36 +0200
Subject: [Buildroot] [PATCH 10/12] pkg-infra: ensure gettext gets built
 before all other packages
In-Reply-To: <201209022305.51613.yann.morin.1998@free.fr>
References: <1346600635-30946-1-git-send-email-yann.morin.1998@free.fr>
 <1346600635-30946-11-git-send-email-yann.morin.1998@free.fr>
 <5043C1F8.6020801@mind.be> <201209022305.51613.yann.morin.1998@free.fr>
Message-ID: <504460D4.1040805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/02/12 23:05, Yann E. MORIN wrote:
>> >     * Move this dependency into the toolchain logic - which means duplicating
>> >  it three times so maybe not such a good idea...
> Not sure I understand this... O_o

  All the more reason not to do it :-)

  I'm currently running a test build with the whole patch series (barring 10/12 and 12/12) - result in an hour or so.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
