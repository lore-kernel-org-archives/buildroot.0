From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 30 Sep 2013 22:39:27 +0200
Subject: [Buildroot] [PATCH v2 6/7] glmark2: new package
In-Reply-To: <CAEBucnCqsAiNc_=Thez9mYRqg2Hi7ArW68v-qwP30we3tbg-ow@mail.gmail.com>
References: <1378441521-10050-1-git-send-email-spenser@gillilanding.com>
 <1378441521-10050-7-git-send-email-spenser@gillilanding.com>
 <523003F0.5050601@mind.be>
 <CAEBucnCqsAiNc_=Thez9mYRqg2Hi7ArW68v-qwP30we3tbg-ow@mail.gmail.com>
Message-ID: <5249E17F.5050308@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/12/13 05:17, Spenser Gilliland wrote:
>>> +       depends on BR2_LARGEFILE
>>> >>+       depends on BR2_PACKAGE_HAS_OPENGL || \
>>> >>+               (BR2_PACKAGE_HAS_OPENGL_EGL && BR2_PACKAGE_HAS_OPENGL_ES)
>>> >>+       select BR2_PACKAGE_JPEG
>>> >>+       select BR2_PACKAGE_LIBPNG12
>>> >>+       help
>>> >>+         glmark2 is a benchmark for OpenGL (ES) 2.0. It uses only the
>>> >>subset of the
>> >
>> >
>> >  Isn't this line too long?
> it's 79 chars with my tab indention at 3 spaces.

  The text itself should be only 72 characters IIRC, otherwise it doesn't 
fit a 80-character terminal.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
