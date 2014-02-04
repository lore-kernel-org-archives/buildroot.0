From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 04 Feb 2014 12:10:11 +0100
Subject: [Buildroot] [PATCH] openssh: bump to version 6.5p1
In-Reply-To: <1391392888-13726-1-git-send-email-gustavo@zacarias.com.ar>
References: <1391392888-13726-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <52F0CA93.5040009@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Gustavo,

On 03/02/14 03:01, Gustavo Zacarias wrote:
> Convert the ever growing drop-SUSv3-legacy patch to a sed expression.

 Since bzero is clearly deprecated even on xBSD, perhaps upstream can be
nudged to accept a patch that replaces it with memset?

 Regards,
 Arnout


> Modify the initscript to create ed25519 server key.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
