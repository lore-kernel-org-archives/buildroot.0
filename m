From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 3 Jul 2017 11:37:40 +0200
Subject: [Buildroot] [RFC PATCH v5 01/11] package/patchelf: use most
 recent version as a base for rpath sanitation
In-Reply-To: <6c844720-dd3d-cd87-b544-152f62afcba7@grandegger.com>
References: <1498811828-6893-1-git-send-email-wg@grandegger.com>
 <1498811828-6893-2-git-send-email-wg@grandegger.com>
 <80a1cf57-34bb-dc8f-e2b9-dd4001f7df6b@mind.be>
 <5b16af39-81af-9a19-dd28-9aebfde9e817@grandegger.com>
 <a30436db-052e-bc75-d727-1147a75da98f@mind.be>
 <401fdb29-ce3a-f5a2-67d7-a03e2f785e87@mind.be>
 <ae53a8d6-9104-b693-bc11-850cdd5cf7bf@mind.be>
 <6c844720-dd3d-cd87-b544-152f62afcba7@grandegger.com>
Message-ID: <af581fbf-241a-261b-3d58-c64efa621814@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03-07-17 09:04, Wolfgang Grandegger wrote:
[snip]
> OK, I will use v0.9 plus a few patches (relevant for rpath sanitization). I see
> at least:
> 
>   a365bcb Remove apparently incorrect usage of "static"

 Well, actually, if you keep it static, that resolves the issue that you have
with libs occurring twice. But it's certainly OK for me if you keep this patch
and then resolve it by adding neededLibFound as an argument.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
