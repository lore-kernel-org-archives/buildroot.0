From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 27 Jan 2014 18:18:59 +0100
Subject: [Buildroot] [PATCH 1/3] Makefile: use absolute paths to
	BR2_EXTERNAL
In-Reply-To: <20140126145342.4c5ccc4e@skate>
References: <cover.1390424302.git.yann.morin.1998@free.fr>
 <44e6c31931f55e79eec713be1a202f2c170667b7.1390424303.git.yann.morin.1998@free.fr>
 <20140126145342.4c5ccc4e@skate>
Message-ID: <52E69503.60101@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/01/14 14:53, Thomas Petazzoni wrote:
> Dear Yann E. MORIN,
>
> On Wed, 22 Jan 2014 21:59:34 +0100, Yann E. MORIN wrote:
>
>> +is interpreted relative to the main Buildroot source directory, not
>> +the Buildroot output directory. Using relative paths can lead to various
>> +broken setups, and thus is highly discouraged in favour of using
>> +absolute paths.
>
> In this patch and in patch 3/3, I don't quite agree with the strong
> suggestion to use absolute paths. I personally find the usage of
> absolute paths ugly, and prefer to have in the manual an explanation on
> how the paths are interpreted, so that the users can understand how to
> properly use either relative paths or absolute paths as they prefer.
>
> To me, a tool that strongly suggests to use absolute paths is broken.

+1

  I have never used anything except relative paths for O= (and I use O= 
all the time :-).

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
