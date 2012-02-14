From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 14 Feb 2012 14:53:23 +0100
Subject: [Buildroot] [PATCH] build: add 'file' option for 'make
	defconfig'
In-Reply-To: <CAMP44s2yuoJ38UdeaRbgeLo9QvPDgrv1roPzgjKL-QZdt7W54g@mail.gmail.com>
References: <1328918596-19369-1-git-send-email-felipe.contreras@gmail.com>
 <CAAXf6LVPo6hWwJFUm3dzFYPAVvC=_=aBP1B7XSQ26spoyuEYFA@mail.gmail.com>
 <CAMP44s2yuoJ38UdeaRbgeLo9QvPDgrv1roPzgjKL-QZdt7W54g@mail.gmail.com>
Message-ID: <201202141453.23995.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 14 February 2012 13:44:03 Felipe Contreras wrote:
> > If one creates a defconfig file, why not store it in 'configs' ?
> 
> Because it's personal.
> 
> I want to be able to clone buildroot, and 'make defconfig
> file=/media/drive/notes/my-buildroot-config'.

 Same here.

 BTW, regarding the naming: eventually I'd like to include BR2_DEFCONFIG
in the .config, which gets qstripped to DEFCONFIG in the Makefile.  This can
be used to be able to store the config again, similar to linux-update-defconfig.

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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120214/24cdb088/attachment.html>
