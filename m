From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 30 Mar 2011 05:23:48 -0400
Subject: [Buildroot] [Off Topic] Sending Patches from Git
In-Reply-To: <4D92F414.1010804@daccii.it>
References: <4D92F414.1010804@daccii.it>
Message-ID: <AANLkTi=J+b_06tGv_emiQaSHGibcCEv-5mvQYvxhmcmF@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 30, 2011 at 5:12 AM, Daniele Salvatore Albano wrote:
> I've commited some code to my local git repository, checkouted from
> buildroot git server, how i can "extract" patches without being mad?

git format-patch <commitid>
git diff -1 <commitid>
-mike
