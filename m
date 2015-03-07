From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 07 Mar 2015 01:37:32 +0100
Subject: [Buildroot] Adding deprecated packages to legacy [was: cups:
 deprecate package due to security issues]
In-Reply-To: <1425649164-31813-1-git-send-email-gustavo@zacarias.com.ar>
References: <1425649164-31813-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <54FA484C.7000905@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/03/15 14:39, Gustavo Zacarias wrote:
> It would probably be better to mark it as a legacy option so users get a
> warning when migrating configuration files, but it would require a
> direct removal for that.

 Good point! The legacy handling was added to avoid that selected config options
silently disappear when upgrading, but that's exactly what happens with the
deprecation!

 Technically it will be a bit difficult to implement, however. But perhaps
that's just because it's already late and my brain is turned off :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
