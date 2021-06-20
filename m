From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 20 Jun 2021 18:17:44 +0200
Subject: [Buildroot] [PATCH 1/1] package/pipewire: fix build
In-Reply-To: <20210609171127.79897-1-fontaine.fabrice@gmail.com>
References: <20210609171127.79897-1-fontaine.fabrice@gmail.com>
Message-ID: <e0acf3f6-5dff-30b2-d1a3-6b9c5c09dafa@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 09/06/2021 19:11, Fabrice Fontaine wrote:
> Drop 0002-meson.build-fix-build-with-uclibc-ng.patch which is not needed
> since 0dda1a44a0859fc15b318e493c151ca1d807ba24 which has been merged in
> master in commit 8d07baab43b5624ad6d73ee58f5a9d4ab8b27049
> 
> While at it, renumber
> 0002-meson-fix-getrandom-detection-for-uclibc.patch to
> 0001-meson-fix-getrandom-detection-for-uclibc.patch (patch number was
> wrong since its addition in commit
> b003cb5d16de9c92baba7dea7a6626c71cefc4fb) and also renumber remaining
> patch
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/4d442c61b137ca1bd2dd32c6802ff0251d39e7a5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

 Applied to master, thanks.

 I took the subject line from Asaf's submission, however: "package/pipewire:
remove already-applied patch and renumber". Much better than "fix build".

 Regards,
 Arnout
