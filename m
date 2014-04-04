From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 04 Apr 2014 07:30:09 +0200
Subject: [Buildroot] new package not built, AR prefix not passed to make
In-Reply-To: <504826970.101021.1396539134908.JavaMail.root@mail>
References: <504826970.101021.1396539134908.JavaMail.root@mail>
Message-ID: <533E4361.9000302@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/04/14 17:32, ?meric Vigier wrote:
[snip]
>   $ cat package/company/libfpga/Config.in 
>   config BR2_PACKAGE_COMPANY_LIBFPGA

 Either the symbol should be BR2_PACKAGE_LIBFPGA, or the directory should
be package/company/company-libfpga (and the .mk file
package/company/company-libfpga/company-libfpga.mk).

 Regards,
 Arnout

[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
