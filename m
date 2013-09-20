From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 20 Sep 2013 10:49:42 +0200
Subject: [Buildroot] [PATCH] Fixed the generation of locales
In-Reply-To: <1379666146-5993-1-git-send-email-thierry.bultel@wanadoo.fr>
 (Thierry Bultel's message of "Fri, 20 Sep 2013 10:35:46 +0200")
References: <1379666146-5993-1-git-send-email-thierry.bultel@wanadoo.fr>
Message-ID: <8761tvev2x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thierry" == Thierry Bultel <thierry.bultel@wanadoo.fr> writes:

 Thierry> From: tbultel <tbultel@basystemes.fr>
 Thierry> Signed-off-by: Thierry Bultel <thierry.bultel@wanadoo.fr>
 Thierry> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> 

 Thierry> The -s option is only mandatory for the charmap,
 Thierry> else the filename is always empty and nothing
 Thierry> is generated.

The signed-off-by / acked-by should go under the commit message (just
above the --- line).

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
