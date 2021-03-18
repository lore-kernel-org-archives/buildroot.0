From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 18 Mar 2021 21:11:19 +0100
Subject: [Buildroot] [PATCH] package/efivar: add upstream post-37
 patches fixing efibootmgr -v
In-Reply-To: <CAMQcK5+QAGBtmbtAmW8g6tyoTa8YLQyvCEXEtBO9K_pYauPNSw@mail.gmail.com>
 (Ryan Barnett's message of "Thu, 18 Mar 2021 12:34:21 -0500")
References: <20210317204335.30705-1-peter@korsgaard.com>
 <CAMQcK5+QAGBtmbtAmW8g6tyoTa8YLQyvCEXEtBO9K_pYauPNSw@mail.gmail.com>
Message-ID: <87zgz0usrc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ryan" == Ryan Barnett <ryan.barnett@collins.com> writes:

 > On Wed, Mar 17, 2021 at 3:45 PM Peter Korsgaard <peter@korsgaard.com> wrote:

..
 >> 
 >> +From fdb803402fb32fa6d020bac57a40c7efe4aabb7d Mon Sep 17 00:00:00 2001
 >> +From: Javier Martinez Canillas <javierm@redhat.com>
 >> +Date: Tue, 5 Mar 2019 17:23:24 +0100
 >> +Subject: [PATCH] ucs2.h: remove unused variable
 >> +
 >> +The const uint16_t pointer is not used since now the two bytes of the
 >> +UCS-2 chars are checked to know if is the termination of the string.
 >> +

 > Should 'Backported from: fdb803402fb32fa6d020bac57a40c7efe4aabb7d' be
 > added here since the patches could be regenerated and the original
 > commit sha1 could be lost?

 > https://buildroot.org/downloads/manual/manual.html#_integrating_patches_found_on_the_web

Given that these are upstream patches, I don't see why they would ever
need to be rebased and regenerated?

-- 
Bye, Peter Korsgaard
