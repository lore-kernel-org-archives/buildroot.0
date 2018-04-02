From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Apr 2018 23:47:05 +0200
Subject: [Buildroot] [PATCH 8/8] download: git: introduce cache feature
In-Reply-To: <20180402145802.17611-8-maxime.hadjinlian@gmail.com> (Maxime
 Hadjinlian's message of "Mon, 2 Apr 2018 16:58:02 +0200")
References: <20180402145802.17611-1-maxime.hadjinlian@gmail.com>
 <20180402145802.17611-8-maxime.hadjinlian@gmail.com>
Message-ID: <877eppl1ra.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > Now we keep the git clone that we download and generates our tarball
 > from there.
 > The main goal here is that if you change the version of a package (say
 > Linux), instead of cloning all over again, you will simply 'git fetch'
 > from the repo the missing objects, then generates the tarball again.

 > This should speed the 'source' part of the build significantly.

 > The drawback is that the DL_DIR will grow much larger; but time is more
 > important than disk space nowadays.

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > ---
 > v4 -> v5:
 >     - Fix comments's content

Committed, thanks.

-- 
Bye, Peter Korsgaard
