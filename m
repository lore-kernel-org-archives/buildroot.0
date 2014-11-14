From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 14 Nov 2014 14:31:29 +0000
Subject: [Buildroot] [PATCH v2 4/4] evemu: add hash
In-Reply-To: <1415917478-24273-4-git-send-email-ps.report@gmx.net>
References: <1415917478-24273-1-git-send-email-ps.report@gmx.net>
 <1415917478-24273-4-git-send-email-ps.report@gmx.net>
Message-ID: <54661241.4010201@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On 11/13/2014 10:24 PM, Peter Seiderer wrote:
> +# Hash from http://lists.freedesktop.org/archives/input-tools/2014-November/001122.html
> +sha256 9e66122fbb97ad8615eda629a823e08114761e9f6ff963d0f55b9e6e47832e58 evemu-2.1.0.tar.xz 

I think the upstream hashes are wrong:

$ wget http://www.freedesktop.org/software/evemu/evemu-2.1.0.tar.xz
--2014-11-14 14:28:23--
http://www.freedesktop.org/software/evemu/evemu-2.1.0.tar.xz
Resolving www.freedesktop.org... 131.252.210.176
Connecting to www.freedesktop.org|131.252.210.176|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 502240 (490K) [application/x-tar]
Saving to: ?evemu-2.1.0.tar.xz?

100%[===========================================================================>]
502,240      218K/s   in 2.3s

2014-11-14 14:28:26 (218 KB/s) - ?evemu-2.1.0.tar.xz? saved [502240/502240]

$ md5sum evemu-2.1.0.tar.xz
006a0f3888840752bf9ce70fe14781bb  evemu-2.1.0.tar.xz
$ sha256sum evemu-2.1.0.tar.xz
0c87360882751356e9f977ebf7438c00fe97deb232ac725dd86e5ba78203ee97
evemu-2.1.0.tar.xz
$ sha1sum evemu-2.1.0.tar.xz
4c29379a35cd770dd0d5fd6204674c45f9e4c392  evemu-2.1.0.tar.xz

Best regards,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Processor IP
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
