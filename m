From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Aug 2013 18:48:51 +0200
Subject: [Buildroot] [PATCH v2 0/3] Fix for top-level parallel make part
 1
In-Reply-To: <20130730132901.0682e15d@skate>
References: <1374138746-23279-1-git-send-email-fabio.porcedda@gmail.com>
 <20130718113809.663c6b58@skate>
 <CAHkwnC8imHc+yWdkUeR6VdehBhpuux_xmKProHu7uFmmR50N8g@mail.gmail.com>
 <20130727131828.0442e227@skate>
 <CAHkwnC-yTeGXQnh64-Ra_TJg4ysYqAPNsNaWhA=_sgiUm5R5bw@mail.gmail.com>
 <20130730120157.0d32a58b@skate>
 <CAHkwnC8SV6L=4a0ain-VysEw3Z8Jg_XLLUJWH1xo6T=FVeYO6A@mail.gmail.com>
 <20130730132901.0682e15d@skate>
Message-ID: <520911F3.1020704@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/07/13 13:29, Thomas Petazzoni wrote:
> I'd really like to see top-level parallel build in Buildroot, but I
> don't think we should do it at the expense of build reproducibility and
> increase of users support complexity.

  That said, I would say that any patch that improves the top-level 
parallel build situation should be accepted, unless it really adds 
complexity. So 1/3 would definitely be acceptable IMHO.

  I also think that 2/3 and 3/3 clarify the generic infrastructure, so 
I'd accept them as well. Only, they also changes the behaviour when you 
touch a .stamp file, so it requires a bit more thinking.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
