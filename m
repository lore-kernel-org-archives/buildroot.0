From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 19 Oct 2017 16:04:24 +0200
Subject: [Buildroot] [PATCH 01/12] dumb-init: new package
In-Reply-To: <20171019002257.27646-1-christian@paral.in>
References: <20171019002257.27646-1-christian@paral.in>
Message-ID: <3b5d387e-8cd6-361e-f9d3-1dd36721bd94@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Christian,

 This is already v3 of the series. Could you explain the changes w.r.t. to the
previous versions? You should do that in the commit message...

On 19-10-17 02:22, Christian Stewart wrote:
> dumb-init is a minimal init process to act as PID 1 for containers.
> 
> dumb-init can be used to satisfy docker-engine's docker-init binary
> requirement.
> 
> In many cases docker-init backing processes like dumb-init must be static, as
> they are executed inside a container in an unknown environment. This
> patch includes an option to specifically compile dumb-init statically, even if
> the system is compiled dynamically.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

 ... here, separated with a --- line:

---
v3:
 - Use foo instead of bar
 - Update commit message to explain baz better [Thomas]

 The [Thomas] means that this change was based on review feedback from Thomas.

 For entirely new patches, you just write:

v3: New patch

 Also, you should send the series with "v3" in the subject. With modern git, you
can do that with the -v3 parameter to git send-email or git format-patch.

 Of course, no need to resend the series for this, but please do explain in a
mail what the changes are. Makes reviewing a lot simpler.


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
