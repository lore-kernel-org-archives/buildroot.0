From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 05 Dec 2013 23:23:49 +0100
Subject: [Buildroot] [PATCHv2] pkg-config: remove deprecated
In-Reply-To: <52A07AC3.8080401@zacarias.com.ar>
References: <1386247960-10328-1-git-send-email-gustavo@zacarias.com.ar>
 <CAAXf6LWCbDGc9Wo6QTMpjHAbgSNTYRxxLT+d1w1Bb4ku-HJ2ew@mail.gmail.com>
 <52A07AC3.8080401@zacarias.com.ar>
Message-ID: <52A0FCF5.8030404@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/12/13 14:08, Gustavo Zacarias wrote:
> On 12/05/2013 10:06 AM, Thomas De Schampheleire wrote:
>> Sorry that I didn't notice this the first time, but Makefile.legacy
>> also still has a reference to host-pkg-config that needs to be
>> removed.
>
> That i'd leave for a little longer since people patching some
> custom/random packages when upgrading their BR might get hit.

  There's not even a need to ever remove it from there, unless the file 
becomes really really large.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
