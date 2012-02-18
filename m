From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Feb 2012 12:20:16 +0100
Subject: [Buildroot] [PATCH 1/1] toolchainfile.cmake: Fix location
In-Reply-To: <1329467035-2349-1-git-send-email-s.martin49@gmail.com>
References: <201202170010.53333.arnout@mind.be>
 <1329467035-2349-1-git-send-email-s.martin49@gmail.com>
Message-ID: <201202181220.17044.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 17 February 2012 09:23:55 Samuel Martin wrote:
> This pacth moves the toolchainfile.cmake in the host tree, as well
       ^^^^^ patch :-)
> as making it generated after the toolchain generation or import and
> checks (depending on the backend used).
> 
> This ensures the correctness and consistency between the actual
> toolchain and the toolchainfile.cmake file describing it.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120218/6a3bf685/attachment-0001.html>
