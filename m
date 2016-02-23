From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Feb 2016 10:42:24 +0100
Subject: [Buildroot] [PATCH 1/3] vala: add vala/valac wrapper
In-Reply-To: <56CBB0B1.6020506@zacarias.com.ar>
References: <1454428908-7183-1-git-send-email-gustavo@zacarias.com.ar>
 <20160221222816.4e53e921@free-electrons.com> <56CA62D8.10309@zacarias.com.ar>
 <56CB9DFA.506@mind.be> <56CBA547.3020200@zacarias.com.ar>
 <56CBAA86.4070305@mind.be> <56CBB0B1.6020506@zacarias.com.ar>
Message-ID: <56CC2980.1020402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/23/16 02:06, Gustavo Zacarias wrote:
> How about relinquising some control? Add a new committer, maybe Yann, yourself
> or some other trusted volunteer, that way the new committer(s) can clean up the
> simple queue and leave the more contentious series for the more experienced
> ones. Maybe put on some simple ground rules like don't commit your own stuff and
> so on.

 This could indeed be a good idea. One reason to limit the number of committers
was to avoid conflicts (i.e. two committers working on the same patch in
parallel), but as I understand it, Thomas and Peter noticed that this isn't
really a problem in practice.

 So indeed, having a third person that applies trivial patches could be
worthwhile to try.

 That said, Yann and I are already spending a large part of our buildroot time
on reviewing patches. I don't think that applying them immediately is going to
make that much of a difference.

 Regards,
 Arnout

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
