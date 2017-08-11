From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 11 Aug 2017 16:06:45 +0200
Subject: [Buildroot] [PATCH v3] libcgi: bump to version 1.1
In-Reply-To: <1502351127-21326-1-git-send-email-xlcwu.taiwan@gmail.com>
References: <1502351127-21326-1-git-send-email-xlcwu.taiwan@gmail.com>
Message-ID: <384a2618-9e81-277e-6bb1-866d6002d7c8@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-08-17 09:45, Joe Lin wrote:
> Cleanup the libcgi package,
> by using https://github.com/rafaelsteil/libcgi as an upstream.
> Remove old patch and use cmake to build new version.
> 
> Signed-off-by: Joe Lin <xlcwu.taiwan@gmail.com>

 I've applied to next, after also merging in the changes by Mario (and adding
his Signed-off-by):
- Remove LIBCGI_SUPPORTS_IN_SOURCE_BUILD = NO
- Use github URL in Config.in
- Use upstream sha256 hash

 I've also added the URL of the upstream hash.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
