From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Dec 2019 08:42:49 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/pkg-golang: enable trimpath
 option for reproducible builds
In-Reply-To: <20191207195707.3798442-1-christian@paral.in> (Christian
 Stewart's message of "Sat, 7 Dec 2019 11:57:07 -0800")
References: <20191207195707.3798442-1-christian@paral.in>
Message-ID: <87lfrnjm9y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > The -trimpath option removes absolute build paths from the target binary. This
 > results in more consistent / reproducible builds across different systems with
 > varying paths to Buildroot.

 > Signed-off-by: Christian Stewart <christian@paral.in>
 > ---

 > v1 -> v2:
 >  - Fixed indentation on trimpath

Committed after extending the commit message to clarify that this is a
new feature in go 1.13, so we shouldn't backport this to 2019.02.x.

-- 
Bye, Peter Korsgaard
