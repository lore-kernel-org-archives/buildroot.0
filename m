From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 03 Nov 2014 22:10:34 +0100
Subject: [Buildroot] [PATCH 6/6] manual: Various tidy changes
In-Reply-To: <1414971595-9972-6-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414971595-9972-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1414971595-9972-6-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <5457EF4A.6050807@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/11/14 00:39, Maxime Hadjinlian wrote:
> Changes performed all over the manual:
>     - In AsciiDoc, you only need 4 dashes to make a code block.
>     - Remove trailing spaces.
>     - Adding '// vim: set syntax=asciidoc:' when missing.
>     - Adding empty lines were needed.
>     - When an example of an external command is done, harmoize the use
>       of the scheme:
>       ' $ cmd'
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

 Seriously, are you combining 5 distinct changes into a 400-line patch? This
doesn't stand a chance of getting reviewed...

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
