From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Apr 2015 20:52:59 +0200
Subject: [Buildroot] grub on target
In-Reply-To: <20150424174149.GA627@postdiluvian.org>
References: <HKXPR01MB0312A3D64DA648D6B74794C9C2EF0@HKXPR01MB0312.apcprd01.prod.exchangelabs.com>
 <20150422195220.GA19841@postdiluvian.org>
 <20150424174149.GA627@postdiluvian.org>
Message-ID: <553FD70B.40209@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Mark,

On 04/24/15 19:41, Mark Mason wrote:
> To answer my own question, it looks like I was having some sort of
> UEFI-related problem, and it was fixed by a newer version of Grub2.

 Perhaps you'd like to submit a patch to bump grub2 to a newer version?

 Regards,
 Arnout

> 
> When booting from Grub2 under some circumstances (seemingly involving
> the phase of the moon and how frustrated I was) I'd get a message
> saying "Couldn't terminate EFI service", then some sort of hang.  Some
> digging around turned up a Grub2 patch to address this issue that
> buildroot-2015-02 doesn't have - Grub2 simply retries the service stop
> if it fails the first time, emitting a message about retrying the
> service stop instead of a message about being unable to stop.
> 
> I have no idea what service(s) are involved, but I've now got reliable
> booting.
> 
> It's worth nothing that the Grub2 info page does address
> phase-of-the-moon issues, but only involving the graphics.
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
