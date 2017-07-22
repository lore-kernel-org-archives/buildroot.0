From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 22 Jul 2017 15:02:45 +0200
Subject: [Buildroot] [PATCH 03/20] package/skeleton: add macro to rsync
 skeleton directory
In-Reply-To: <05879dad2f97f99ddce2b01753aae0e3111f4a43.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <05879dad2f97f99ddce2b01753aae0e3111f4a43.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <2c30f633-ccdb-2e80-fbab-983adf21a80d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-07-17 19:25, Yann E. MORIN wrote:
> Define a macro that skeleton packages can call to install their skeleton
> directories. Since at least one occurence of it will want to install in
                                  occurrence
> staging, the macro must accept a destination path, rather than hard-code
> target as the destination.

 By the way, the overlay copying uses almost the same rsync arguments, so they
can be used there as well.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
