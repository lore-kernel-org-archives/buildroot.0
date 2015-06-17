From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 18 Jun 2015 00:04:58 +0200
Subject: [Buildroot] [PATCH] python: bump to 2.7.10
In-Reply-To: <1434490571-16422-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1434490571-16422-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <5581EF0A.8030601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/16/15 23:36, Thomas Petazzoni wrote:
> diff --git a/package/python/python.hash b/package/python/python.hash
> index f741e85..6258ec2 100644
> --- a/package/python/python.hash
> +++ b/package/python/python.hash
> @@ -1,2 +1,4 @@
> -# Locally calculated after checking pgp signature
> -sha256	90d27e14ea7e03570026850e2e50ba71ad20b7eb31035aada1cf3def8f8d4916	Python-2.7.9.tar.xz
> +# From https://www.python.org/downloads/release/python-2710/
> +md5	c685ef0b8e9f27b5e3db5db12b268ac6	Python-2.7.10.tar.xz
> +# Locally calculated
> +sha256	1cd3730781b91caf0fa1c4d472dc29274186480161a150294c42ce9b5c5effc0	Python-2.7.9.tar.xz
                                                                                                   ^^
                                                                                                   10

 With that fixed:
 Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 It's a pity that it's not possible to check against such mistakes in the 
check-hash script.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
