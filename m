From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 May 2021 22:21:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/boost: fix broken BOOST_SITE URL
In-Reply-To: <20210510081832.32157-1-sebastien.szymanski@armadeus.com>
 (=?utf-8?Q?=22S=C3=A9bastien?= Szymanski"'s message of "Mon, 10 May 2021
 10:18:32 +0200")
References: <20210510081832.32157-1-sebastien.szymanski@armadeus.com>
Message-ID: <871raes5kt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "S?bastien" == S?bastien Szymanski <sebastien.szymanski@armadeus.com> writes:

 > Current URL returns 403 error:
 > --2021-05-10 10:04:12--  https://dl.bintray.com/boostorg/release/1.75.0/source/boost_1_75_0.tar.bz2
 > Resolving dl.bintray.com... 18.193.131.58, 3.66.199.110
 > Connecting to dl.bintray.com|18.193.131.58|:443... connected.
 > HTTP request sent, awaiting response... 403 Forbidden
 > 2021-05-10 10:04:12 ERROR 403: Forbidden.

 > Update the URL to fix this issue.

 > Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>

Committed after extending the commit message with a description of what
has gone wrong (E.G. bintray has been sunset on May 1st):

https://jfrog.com/blog/into-the-sunset-bintray-jcenter-gocenter-and-chartcenter/

-- 
Bye, Peter Korsgaard
