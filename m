From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Nov 2012 08:06:43 +0100
Subject: [Buildroot] [PATCH 1/2] perl: fix configure step
In-Reply-To: <20121110170735.01056125@skate>
References: <1352558468-3643-1-git-send-email-francois.perrad@gadz.org>
 <20121110170735.01056125@skate>
Message-ID: <50A1F183.5070405@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/11/12 17:07, Thomas Petazzoni wrote:
> Dear Francois Perrad,
>
> On Sat, 10 Nov 2012 15:41:07 +0100, Francois Perrad wrote:
>> >  Configure -A symbol=val generates a extra space in config.sh,
>> >  which causes failure like this :
>> >       Building Module-Runtime-0.013
>> >       Unknown OS type ' linux' - using default settings
>> >
>> >  Signed-off-by: Francois Perrad<francois.perrad@gadz.org>
> Instead of doing what the patch does below, wouldn't it be better to
> fix this -A option so that it doesn't add inappropriate spaces?

  I've adapted the patch accordingly and added it to my perl-fixes series (which
I'll repost in a moment).


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
