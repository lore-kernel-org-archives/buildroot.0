From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Oct 2011 00:45:10 +0200
Subject: [Buildroot] [PATCH] package: add polarssl library support
In-Reply-To: <20111012231639.4182ac22@skate>
References: <1318435980-27451-1-git-send-email-plagnioj@jcrosoft.com>
 <20111012231639.4182ac22@skate>
Message-ID: <201110140045.10630.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wednesday 12 October 2011 23:16:39, Thomas Petazzoni wrote:
> > +define POLARSSL_BUILD_CMDS
> > +     AR="$(TARGET_AR)" CC="$(TARGET_CC)" $(MAKE) -C $(@D)/library all
> > +endef
> 
> You probably want to pass the cflags as well ?

 ... which is why we have $(TARGET_MAKE_ENV).

 
 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20111014/2529bab4/attachment-0001.html>
