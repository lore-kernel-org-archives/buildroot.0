From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Mar 2018 11:15:25 +0100
Subject: [Buildroot] [PATCH v2 0/9] upgrade docker-engine and associated
 components
In-Reply-To: <20180301072012.25884-1-christian@paral.in> (Christian Stewart's
 message of "Thu, 1 Mar 2018 02:20:03 -0500")
References: <20180301072012.25884-1-christian@paral.in>
Message-ID: <87y3jchzk2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Christian" == Christian Stewart <christian@paral.in> writes:

 > Hi all,
 > This series upgrades Docker and associated components:

 >  - runc to 9f9c96235cc97674e935002fc3d78361b696a69e
 >  - docker-containerd to v1.0.2
 >  - docker-engine to v2018.03.0-ce-rc1

I am far from a docker expert, but isn't this an 'edge' release? Given
the Buildroot release schedule, wouldn't it make more sense to use the
'stable' releases with a similar quarterly support/release schedule?

-- 
Bye, Peter Korsgaard
