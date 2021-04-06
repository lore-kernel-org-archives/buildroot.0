From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Apr 2021 13:02:46 +0200
Subject: [Buildroot] [PATCH 2/2] package/python-py: security bump to
 version 1.10.0
In-Reply-To: <20210405173027.4159626-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 5 Apr 2021 19:30:27 +0200")
References: <20210405173027.4159626-1-fontaine.fabrice@gmail.com>
 <20210405173027.4159626-2-fontaine.fabrice@gmail.com>
Message-ID: <878s5vhe09.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix CVE-2020-29651: A denial of service via regular expression in the
 > py.path.svnwc component of py (aka python-py) through 1.9.0 could be
 > used by attackers to cause a compute-time denial of service attack by
 > supplying malicious input to the blame functionality.

 > Add py/_vendored_packages/iniconfig-1.1.1.dist-info/LICENSE (MIT) which
 > has been added with
 > https://github.com/pytest-dev/py/commit/94cf44fd41d957eb50773d3e4fb54e931836779e

 > https://github.com/pytest-dev/py/blob/1.10.0/CHANGELOG.rst

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
