From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 12 Feb 2014 08:18:52 +0100
Subject: [Buildroot] [PATCHv2 1/4] python: fixup python-config script
In-Reply-To: <1392119829-31535-2-git-send-email-gustavo@zacarias.com.ar>
References: <1392119829-31535-1-git-send-email-gustavo@zacarias.com.ar>
 <1392119829-31535-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <52FB205C.6070601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/02/14 12:57, Gustavo Zacarias wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> The original version uses sysconfig from the python interpreter
> (normally host-python) which isn't really suited to provide information
> of the target python.
> Use the pure shell preprocessed backport from the upcoming python 3.4
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
