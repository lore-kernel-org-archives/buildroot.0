From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 13 Aug 2017 18:00:40 +0200
Subject: [Buildroot] [PATCH 1/3] package/libb64: new package
In-Reply-To: <1502467249-2861-2-git-send-email-angelo.compagnucci@gmail.com>
References: <1502467249-2861-1-git-send-email-angelo.compagnucci@gmail.com>
 <1502467249-2861-2-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <16847176-5001-1660-7b1a-96cbed5e67f0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11-08-17 18:00, Angelo Compagnucci wrote:
> This patch adds libb64, a library of ANSI C routines for fast
> encoding/decoding data into and from a base64-encoded format.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

 Applied to next with significant changes:
    - properly wrap Config.in
    - move from Crypto to Other menu
    - don't install to target
    - don't make headers executable
    - don't add -D to install with multiple source files
    - extend commit log

 Could you re-test the final version on the next branch?

 One of the issues was the wrapping of Config.in. For future patches, please use
the check-package script before submitting.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
