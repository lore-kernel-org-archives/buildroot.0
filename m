From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 20 Nov 2015 23:43:45 +0100
Subject: [Buildroot] [PATCH v3] sdl: overwrite libpth autodetection
In-Reply-To: <1447969367-21983-1-git-send-email-ps.report@gmx.net>
References: <1447969367-21983-1-git-send-email-ps.report@gmx.net>
Message-ID: <564FA221.9090104@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19-11-15 22:42, Peter Seiderer wrote:
> The sdl libpth autodetection gets confused in case a host
> version is present. Overwrite libpth autodection for the

 For future reference: it's override, not overwrite. You could say "overwrite"
if you had a patch that fixes the autodetection, but you want to say that you
force it not to use autodetection.

 Regards,
 Arnout

> target build dependent on BR2_PACKAGE_LIBPTHSEM_COMPAT and
> use pth-config from staging directory.


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
