From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 23 Apr 2015 00:26:06 +0200
Subject: [Buildroot] [PATCH] package: kill pointless text justification
In-Reply-To: <1429740874-8619-1-git-send-email-gustavo@zacarias.com.ar>
References: <1429740874-8619-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <55381FFE.7090602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/23/15 00:14, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Checked that it is a whitespace-only change, and manually went over the entire
patch to see what really changed.

 Actually, the subject line should have been:

package: kill pointless double space at end of sentence

but that's a minor issue :-)

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
