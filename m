From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Jul 2015 22:49:18 +0200
Subject: [Buildroot] [PATCH v8 01/16] policycoreutils: new package
In-Reply-To: <CANn-YGTpn+yVcQxGt+TNCEVu5jWsb07ck-S4tQSRRDgqKbuJMQ@mail.gmail.com>
References: <1436570882-56442-1-git-send-email-clayton.shotwell@rockwellcollins.com>
 <1436570882-56442-2-git-send-email-clayton.shotwell@rockwellcollins.com>
 <CAHXCMML5nEattdjgAHfBXPhXct=7kcu3zQcPUGHasUWozQ3GbQ@mail.gmail.com>
 <CANn-YGTpn+yVcQxGt+TNCEVu5jWsb07ck-S4tQSRRDgqKbuJMQ@mail.gmail.com>
Message-ID: <55A575CE.4080306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/14/15 16:28, Clayton Shotwell wrote:
> I'll have to look through some different architecture to see which
> ones use lib and which use lib64.

 That shouldn't matter for us, since we symlink lib64 -> lib (or lib32 -> lib).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
