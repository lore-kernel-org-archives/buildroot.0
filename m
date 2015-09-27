From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 27 Sep 2015 13:50:51 +0200
Subject: [Buildroot] [PATCH v2 1/4] Remove trailing slash from all
 package site URLs
In-Reply-To: <1443346764-7433-2-git-send-email-luca@lucaceresoli.net>
References: <1443346764-7433-1-git-send-email-luca@lucaceresoli.net>
 <1443346764-7433-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <5607D81B.4000101@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Luca Ceresoli wrote:
 > The recommended form is without the trailing slash. Buildroot will 
add a slash
 > between FOO_SITE and FOO_SOURCE as appropriate.
 >
 > This avoids the need for the $$($(2)_SITE:/=) magic in 
package/pkg-generic.mk
 > to avoid double slashes in download URLs, like
 > https://mosh.mit.edu//mosh-1.2.5.tar.gz which works but is dirty.
 >
 > Note: this work has already been done in b0b9606530dfc6de4030 a few 
months ago,
 > but no check has been added at that time to avoid new slashes to slip 
in, and
 > so they did. This time a patch will follow immediately to catch future
 > mistakes to be unnoticed.

And of course the last sentence should be written in English: "...to
prevent future mistakes from being unnoticed".

-- 
Luca
