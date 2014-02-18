From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Feb 2014 07:28:26 +0100
Subject: [Buildroot] [PATCH v4 4/7] *.mk: replace (TARGET|HOST)_PATH by
 BR_PATH
In-Reply-To: <1392559113-5215-5-git-send-email-s.martin49@gmail.com>
References: <1392559113-5215-1-git-send-email-s.martin49@gmail.com>
 <1392559113-5215-5-git-send-email-s.martin49@gmail.com>
Message-ID: <5302FD8A.3090207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/02/14 14:58, Samuel Martin wrote:
> Thanks to the 2 previous patches of the series, BR_PATH contains
> all locations in which host-packages may install programs.
> 
> This patch replaces the occurrences TARGET_PATH and HOST_PATH with
> BR_PATH, everywhere these variables are used in the *.mk files.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

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
