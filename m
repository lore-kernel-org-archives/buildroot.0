From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 17:14:59 +0100
Subject: [Buildroot] [git commit] package/python-pyyaml: security bump
 to 4.2b4
In-Reply-To: <20190113131422.81ADA81361@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sun, 13 Jan 2019 14:14:18 +0100")
References: <20190113131422.81ADA81361@busybox.osuosl.org>
Message-ID: <87k1iudocc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=1cf071726d3637458cfb0f3f546c69377f720de0
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Fixes CVE-2017-18342: In PyYAML before 4.1, the yaml.load() API
 > could execute arbitrary code.

 > Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.11.x, thanks.

-- 
Bye, Peter Korsgaard
