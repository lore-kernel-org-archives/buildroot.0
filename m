From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 26 Feb 2014 22:23:25 +0100
Subject: [Buildroot] [PATCH v3 1/1] ncftp: fix cross-compilation test
In-Reply-To: <530E56FC.20608@openwide.fr>
References: <1393016452-10812-1-git-send-email-romain.naour@openwide.fr>
 <530A74F4.8030906@mind.be> <530A7B97.3090701@openwide.fr>
 <530CCF4C.7090208@mind.be> <530E56FC.20608@openwide.fr>
Message-ID: <530E5B4D.3090205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/02/14 22:05, Romain Naour wrote:
> I wonder if any other packages can be affected by this issue ?
> At least we know that autoconf 2.13 is not safe for cross-compilation...

 The first autoconf version after 2.13 is 2.50, and this solves the
cross-compilation issue (see release notes). 2.50 was released on May 21,
2001. Seems unlikely that there are many packages that are distributed
with such an ancient autoconf...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
