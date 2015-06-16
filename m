From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 17 Jun 2015 00:47:40 +0200
Subject: [Buildroot] Problem with package efl 1.14.1
In-Reply-To: <55808596.2050506@openwide.fr>
References: <CALW-xeoh40gFPTU_zWeeOF+ZQLxE5-aN8KC1OiR_2ZsmVDXmsQ@mail.gmail.com>
 <55808596.2050506@openwide.fr>
Message-ID: <5580A78C.5060401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/16/15 22:22, Romain Naour wrote:
> File "../../gio/gdbus-2.0/codegen/gdbus-codegen", line 34
> SyntaxError: Non-ASCII character '\xc3' in file
> ../../gio/gdbus-2.0/codegen/gdbus-codegen on line 34

 This smells like a LANG issue. Guillaume, could you do:

make clean
LANG=C LC_ALL=C make


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
