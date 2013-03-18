From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 18 Mar 2013 07:28:31 +0100
Subject: [Buildroot] segfault of test on buildroot system
In-Reply-To: <5141FFBD.6050206@mail.ru>
References: <5141FFBD.6050206@mail.ru>
Message-ID: <5146B40F.50801@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/14/13 17:50, Alexander Varnin wrote:
>      DisplayPassDevice(void * config)
>      {
>          throw Exception();
>      }

  It's been a while since I coded C++, so I'm not sure, but doesn't the 
lifetime of the Exception object end before the parent handler handles it?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
