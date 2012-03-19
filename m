From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 20 Mar 2012 00:51:48 +0100
Subject: [Buildroot] [PATCH 5/6] Fix installation for the lighttpd
	package
In-Reply-To: <30bfa1684abbd7aabf536fdff545b06f26a70f35.1332172636.git.maxime.ripard@free-electrons.com>
References: <cover.1332172636.git.maxime.ripard@free-electrons.com>
 <30bfa1684abbd7aabf536fdff545b06f26a70f35.1332172636.git.maxime.ripard@free-electrons.com>
Message-ID: <201203200051.48409.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 19 March 2012 16:59:39 Maxime Ripard wrote:
>  package/lighttpd/lighttpd.conf |  445 ++++++++++++++++++++++++++++++++++++++++

 Same remark as for systemd: wouldn't it be better to patch the upstream
file instead of copying it?  Also, why did you revert the disabling of
range requests for pdf documents?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
