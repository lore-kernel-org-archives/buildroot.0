From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 8 Jul 2018 00:10:27 +0200
Subject: [Buildroot] [PATCH]
 configs/olimex_a10_olinuxino_lime_defconfig: new board
In-Reply-To: <1530777523-19802-1-git-send-email-leon.anavi@konsulko.com>
References: <1530777523-19802-1-git-send-email-leon.anavi@konsulko.com>
Message-ID: <bdb14ace-9729-9b01-5b53-7903dd5f88db@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Leon,

 Sorry to come back with still more comments...

On 05-07-18 09:58, Leon Anavi wrote:
> Add a defconfig for the Olimex A10-OLinuXino-LIME, reusing most
> of the A20-OLinuXino-Lime and A13-OLinuXino files.

 Er, no, you copied those files, you didn't reuse them...

 All the support files are identical or compatible with those in a20_olinuxino.
So I think it's better to just add to that. Perhaps, for clarity, create a
symlink from a10_olinuxino -> a20_olinuxino.

 Otherwise, looks good to me. Oh, yes, one more thing: when you send a new
version, please add a patch changelog below the --- line, and also add the
version in the subject using the -v4 option to git format-patch. See [1].


 Regards,
 Arnout

[1] https://buildroot.org/downloads/manual/manual.html#_patch_revision_changelog

> 
> The configurations for Olimex A10-OLinuXino-LIME feature:
> - U-Boot 2018.03
> - Mainline Linux kernel 4.14.26
> 
> Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
