From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 07 Sep 2013 08:06:53 +0200
Subject: [Buildroot] [PATCH v2] Fix build reproducibility in Make 3.82
In-Reply-To: <1378197941-30752-1-git-send-email-jezz@sysmic.org>
 (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Tue, 3 Sep 2013 10:45:41 +0200")
References: <52257E0D.3000100@mind.be>
 <1378197941-30752-1-git-send-email-jezz@sysmic.org>
Message-ID: <87li3917ya.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 J?r?me> Make 3.82 do not sort anymore result of wildcards (see
 J?r?me> http://comments.gmane.org/gmane.comp.gnu.make.bugs/4260). This may break
 J?r?me> build reproducibility.

 J?r?me> This patch sort results of wildcards to ensure reproducibility.

 J?r?me> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
 J?r?me> ---
 J?r?me>  V2:
 J?r?me>     Add forgotten file support/dependencies/dependencies.mk. Even if it
 J?r?me>     does not make difference for the build result, I prefer to be 
 J?r?me>     consistent.

Committed, thanks.

-- 
Bye, Peter Korsgaard
