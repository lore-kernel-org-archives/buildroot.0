From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Jun 2015 09:46:10 +0200
Subject: [Buildroot] [git commit] gcc: switch to gcc 4.9 as the default
 version
In-Reply-To: <20150622222746.025B07FAFF@busybox.osuosl.org>
References: <20150622222746.025B07FAFF@busybox.osuosl.org>
Message-ID: <55890EC2.2040505@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/23/15 00:19, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=07536bbb3df3fb065b8c6a31cf4519c6a0054ad7
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Now that we have added gcc 5.1, it's time to make gcc 4.9 the default
> version used in Buildroot.

 I think we should again update our autobuilder toolchains in this case, to make
sure we actually test the thing that we set as default.

[I have bad internet connection now so I didn't check if perhaps the autobuilder
toolchains have already been updated. If so, sorry for the noise.]

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
