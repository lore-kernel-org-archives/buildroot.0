From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 08 Oct 2013 19:41:51 +0200
Subject: [Buildroot] [PATCH 1/1] ngrep: fix static linking issue with
 libpcre
In-Reply-To: <20131008102042.3a938439@skate>
References: <52532B99.20204@mind.be>
 <93031320.8180859.1381219933227.JavaMail.root@openwide.fr>
 <20131008102042.3a938439@skate>
Message-ID: <525443DF.2090809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/08/13 10:20, Thomas Petazzoni wrote:
> Dear Romain Naour,
>
> On Tue, 8 Oct 2013 10:12:13 +0200 (CEST), Romain Naour wrote:
>
>> Also, Gentoo seems to have a patch for this problem.
>> http://ftp.eenet.ee/gentoo-portage/net-analyzer/ngrep/files/ngrep-1.45.patch
>>
>> Maybe just patch Makefile.in to add -lpcre beside -lpcap ?
>
> Or use pkg-config to get the proper list of libraries.

  If upstream is dead, that's a bit pointless, no?

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
