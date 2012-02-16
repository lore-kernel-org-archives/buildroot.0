From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 16 Feb 2012 21:49:05 +0100
Subject: [Buildroot] Illegal instruction Built bcc
In-Reply-To: <4F3CDE48.2030605@labri.fr>
References: <4F3BF8DC.6080608@labri.fr> <201202152155.08608.arnout@mind.be>
 <4F3CDE48.2030605@labri.fr>
Message-ID: <201202162149.06340.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 16 February 2012 11:45:28 Jigar SOLANKI wrote:
> But, when I try to compile it with a cross compiler that I have built
> using the bcc sources, it fails with the illegal instruction trap.
> 
> Here is the output of both -v :

 Oh, so you're trying to build a compiler for a bare (non-Linux) system...
Can't really help with that, I'm afraid...  Why are you asking this on
the buildroot mailing list?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120216/f4749ffe/attachment.html>
