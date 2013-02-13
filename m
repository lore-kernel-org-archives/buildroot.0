From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Feb 2013 23:12:48 +0100
Subject: [Buildroot] [PATCH v3 1/1] openpgm: new package
In-Reply-To: <1360749821-19238-1-git-send-email-alexander.lukichev@gmail.com>
References: <1360749821-19238-1-git-send-email-alexander.lukichev@gmail.com>
Message-ID: <511C0FE0.8020105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/02/13 11:03, Alexander Lukichev wrote:
> OpenPGM is an open source implementation of the Pragmatic General
> Multicast (PGM) specification in RFC 3208 available atwww.ietf.org.
> It is required for PGM/EPGM support in ZeroMQ library.
>
> Signed-off-by: Alexander Lukichev<alexander.lukichev@gmail.com>
> ---
> v3: improved according to community suggestions:
> - added Signed-off-by and the reason to the cross-compilation patch;
> - specified toolchain requirements in Config.in.
>
> The package can be built without WCHAR but this is supported
> only by its SCons and CMake build systems (for development). Autotools
> based build system (for releases) does not support this. IPV6 and
> thread support requirements are mandatory.

  In that case, why not just use cmake instead of autotools?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
