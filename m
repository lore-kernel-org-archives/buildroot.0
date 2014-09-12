From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 12 Sep 2014 23:31:47 +0200
Subject: [Buildroot] [PATCH 10/12] sdl: remove dga support in no MMU
In-Reply-To: <1410537011-29662-11-git-send-email-jezz@sysmic.org>
 (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Fri, 12 Sep 2014 17:50:09 +0200")
References: <1410537011-29662-1-git-send-email-jezz@sysmic.org>
 <1410537011-29662-11-git-send-email-jezz@sysmic.org>
Message-ID: <87wq98a5ks.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 > DGA support use fork. This prevent executables to link with libSDL.so.
 > Fixes:
 >   http://sysmic.org/~jezz/results/5e50c243 (package sdl_mixer)
 >   http://sysmic.org/~jezz/results/734afef8 (package sdl_net)
 >   http://sysmic.org/~jezz/results/e2310eb9 (package sdl_image)
 >   http://sysmic.org/~jezz/results/e2cdcc9a (package sdl_sound)

 > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
