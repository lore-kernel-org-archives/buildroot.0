From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Oct 2015 21:18:25 +0100
Subject: [Buildroot] [PATCH 0/4] Supporting a second Barebox build to
 build the MLO/SPL
In-Reply-To: <20151027172130.GA15385@smipidev>
References: <1445801636-7554-1-git-send-email-pieter@boesman.nl>
 <20151026045735.52c0f9e5@free-electrons.com> <20151026212726.GA9761@smipidev>
 <20151027172130.GA15385@smipidev>
Message-ID: <562FDC11.3080109@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27-10-15 18:21, Pieter Smith wrote:
> What are your thoughts on this?

 Thinking out of the box here: would it be possible to keep a single barebox
package and do everything twice (or more) in the _CMDS, with different output
directories?

 Granted, that will be a bit tricky w.r.t. the kconfig infra.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
