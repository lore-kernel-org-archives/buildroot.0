From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 12 Jul 2015 16:26:05 +0200
Subject: [Buildroot] [PATCH 1/7] Add <PKG>_STRIP_COMPONENTS for packages
 with non-standard tarballs
In-Reply-To: <55A19F0A.7010002@mind.be>
References: <1436624110-20428-1-git-send-email-luca@lucaceresoli.net>
 <55A19F0A.7010002@mind.be>
Message-ID: <55A278FD.9090306@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout,

Arnout Vandecappelle wrote:
>   Since the cover letter is missing, I'll reply to this one...
>
> On 07/11/15 16:15, Luca Ceresoli wrote:
>> Usually package tarballs contain only a directory named
>> "<pkg-name>-<pkg-version>" which contains the actual source tree. To properly
>> extract the source files in $(BUILD_DIR), Buildroot passes the
>> --strip-components=1 option to tar.
>
>   Great work.
>
>   I think the following packages could also be converted:
>
> flite

I gave it a try. Here it is, http://patchwork.ozlabs.org/patch/494116/
but I'm not sure it's exactly a lovely patch...

-- 
Luca
