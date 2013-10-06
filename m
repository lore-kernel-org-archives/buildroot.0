From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 06 Oct 2013 20:48:49 +0200
Subject: [Buildroot] [PATCH] Fix glibc dependency to gcc-intermediate
In-Reply-To: <1381048066-18510-1-git-send-email-jezz@sysmic.org>
 (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Sun, 6 Oct 2013 10:27:46 +0200")
References: <1381048066-18510-1-git-send-email-jezz@sysmic.org>
Message-ID: <87siwedylq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 J?r?me> In commit ebc81933, we rerverted 2babed4a, but meanwhile eglibc/ was
 J?r?me> renamed glibc/ so rules eglibc-build muste renmaed glibc-build to
 J?r?me> correctly work.

Committed with the typos fixed, thanks.

-- 
Bye, Peter Korsgaard
