From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 20 Oct 2012 18:15:15 +0200
Subject: [Buildroot] [PATCH 12/13] target/generic: add filesystem
 overlay option
In-Reply-To: <CAAXf6LX7XXSGyvxZegNusZn6ecD_-4_N9665Lzp2RkXpy+6RLA@mail.gmail.com>
References: <20121013231344.17317.92930.stgit@localhost>
 <20121013231448.17317.37653.stgit@localhost>
 <CAAXf6LX7XXSGyvxZegNusZn6ecD_-4_N9665Lzp2RkXpy+6RLA@mail.gmail.com>
Message-ID: <5082CE13.9020000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/10/12 20:50, Thomas De Schampheleire wrote:
> On Sun, Oct 14, 2012 at 1:14 AM, Arnout Vandecappelle (Essensium/Mind)
> <arnout@mind.be>  wrote:
>> >  From: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
>> >
>> >  The filesystem overlay is a tree that is copied over the target fs
>> >  after building everything - which is currently usually done in the
>> >  post-build script.
>> >
>> >  Also replace the documentation for a custom skeleton with the
>> >  filesystem overlay and deprecate the custom skeleton.
>> >
>> >  Signed-off-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
> Note that I'm not against this feature, but we discussed this before
> (I think on Buildroot Developer Day in Brussels beginning of 2012, or
> otherwise on the list) and the outcome back then was that it was not
> necessary as it was very easy to add directly to the post-build
> script.

  I understood it as: it's a low-priority nice-to-have because there are
other ways to do it. So I will resend this patch.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
