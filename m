From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 May 2013 09:01:26 +0200
Subject: [Buildroot] [PATCH 2/3] package/libedit2: new package
In-Reply-To: <20130514224214.GB8043@free.fr>
References: <cover.1368567696.git.yann.morin.1998@free.fr>
 <527cc033d0024e5562a9e5984423088bf343921a.1368567696.git.yann.morin.1998@free.fr>
 <5192BA45.6010401@mind.be> <20130514224214.GB8043@free.fr>
Message-ID: <519332C6.9080509@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/05/13 00:42, Yann E. MORIN wrote:
> Arnout, All,
>
> On 2013-05-15 00:27 +0200, Arnout Vandecappelle spake thusly:
>>   Why is it called libedit2? Both NetBSD and Debian call it libedit...
>
> Debian actually calls it:
>      libedit2
>      libedit-dev
> See: http://packages.debian.org/search?keywords=libedit

  The digit after the libxxx binary is the library soname, which isn't 
relevant for us. You should consider the source package name as the 
upstream name.

  Putting a digit behind the name should only be necessary for major 
non-backward-compatible API changes, like qt5 or gstreamer1.

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
