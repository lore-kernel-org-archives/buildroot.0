From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 06 May 2012 14:46:37 +0200
Subject: [Buildroot] [Bug 5186] New: initramfs/cpio should support lzo
 compression
In-Reply-To: <bug-5186-163@https.bugs.busybox.net/>
References: <bug-5186-163@https.bugs.busybox.net/>
Message-ID: <4FA672AD.2030905@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/05/12 17:13, bugzilla at busybox.net wrote:
> Created attachment 4340
>    -->  https://bugs.busybox.net/attachment.cgi?id=4340
> cpio lzo support
>
> Linux supports lzo compression for the initramfs image nowadays, so it would be
> nice if buildroot did as well
There should be a variable $(LZOP) and a dependency on host-lzop, just like for lzma.  lzop is not a package that you 
can expect to be available on the host.

  Regards,
  Arnout

  PS What's the policy for reacting to patches posted on bugzilla?

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
