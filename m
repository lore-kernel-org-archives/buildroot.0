From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 5 Mar 2017 23:35:56 +0100
Subject: [Buildroot] [PATCH] mkusers: create system users/groups below
 UID/GID 1000
In-Reply-To: <20170305222631.GL3671@free.fr>
References: <1486647783-6622-1-git-send-email-p.debruijn@unilogic.nl>
 <20170305222631.GL3671@free.fr>
Message-ID: <0b9b92bb-4035-ffcb-41aa-c2dad511e34c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-03-17 23:26, Yann E. MORIN wrote:
> I would love to see that range being configurable in the menuconfig,
> instead of having to edit the file to change the range.
> 
> I believe this would be much more user-friendly and would cover your
> use-case as well. I believe. ;-)

 I agree, and I've marked the patch as Changes Requested in patchwork accordingly.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
