From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 31 Jan 2019 12:29:18 +0100
Subject: [Buildroot] [PATCH] docker-compose: backport upstream patch for
 pyyaml 4.x support
In-Reply-To: <20190130212713.19245-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 30 Jan 2019 22:27:13 +0100")
References: <20190130212713.19245-1-peter@korsgaard.com>
Message-ID: <87bm3xysj5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Otherwise docker-compose fails at runtime with:
 > docker-compose
 > Traceback (most recent call last):
 >   File "/usr/bin/docker-compose", line 6, in <module>
 >     from pkg_resources import load_entry_point
 >   File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 3123, in <module>
 >   File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 3107, in _call_aside
 >   File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 3136, in _initialize_master_working_set
 >   File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 580, in _build_master
 >   File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 593, in _build_from_requirements
 >   File "usr/lib/python2.7/site-packages/pkg_resources/__init__.py", line 781, in resolve
 > pkg_resources.DistributionNotFound: The 'PyYAML<4,>=3.10' distribution was not found and is required by docker-compose

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
