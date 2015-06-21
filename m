From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 21 Jun 2015 14:48:28 +0200
Subject: [Buildroot] [PATCH 2/3] python-robotframework: New package
In-Reply-To: <1434362765-1074-3-git-send-email-denis.thulin@openwide.fr>
References: <1434362765-1074-1-git-send-email-denis.thulin@openwide.fr>
 <1434362765-1074-3-git-send-email-denis.thulin@openwide.fr>
Message-ID: <5586B29C.6080207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/15/15 12:06, Denis THULIN wrote:
> +PYTHON_ROBOTFRAMEWORK_SITE = https://pypi.python.org/packages/source/r/robotframework/

 There shouldn't be a trailing / here, so something must be done about that in
the scanpypi script.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
