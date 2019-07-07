From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 07 Jul 2019 08:20:12 +0200
Subject: [Buildroot] [PATCH v1 1/1] package/bzip2: cve-2019-12900 fix
 for bzip2 1.0.6
In-Reply-To: <20190626142042.15714-1-jared.bents@rockwellcollins.com> (jared
 bents's message of "Wed, 26 Jun 2019 09:20:42 -0500")
References: <20190626142042.15714-1-jared.bents@rockwellcollins.com>
Message-ID: <87v9wecqn7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "jared" == jared bents <jared.bents@rockwellcollins.com> writes:

 > From: Jared Bents <jared.bents@rockwellcollins.com>
 > Patch to resolve cve-2019-12900 which affects bzip2
 > versions 1.0.6 and older

 > More information can be found at
 > https://nvd.nist.gov/vuln/detail/CVE-2019-12900

 > This applies to both master and 2019.02

 > Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>

Committed to 2019.02.x and 2019.05.x, thanks.

-- 
Bye, Peter Korsgaard
