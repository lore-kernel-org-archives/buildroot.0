From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 06 Oct 2012 14:29:45 +0200
Subject: [Buildroot] [PATCH v8 07/11] cpanminus: new package
In-Reply-To: <1348593508-14254-7-git-send-email-francois.perrad@gadz.org>
References: <1348593508-14254-1-git-send-email-francois.perrad@gadz.org>
 <1348593508-14254-7-git-send-email-francois.perrad@gadz.org>
Message-ID: <50702439.8030409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Didn't have time to look at the patch in detail; however:

On 25/09/12 19:18, Francois Perrad wrote:
> +config BR2_PACKAGE_CPANMINUS_NATIVE_DEPENDENCIES
> +	string "native dependencies"
> +	help
> +	  Some XS modules require native libraries.
> +

  This one certainly deserves a better explanation.  How about:

Some XS modules require native libraries. Give a list here of
buildroot packages that are required for the CPAN modules selected
above.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
