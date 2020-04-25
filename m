From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 25 Apr 2020 09:26:46 +0200
Subject: [Buildroot] [PATCH] package/python-crossbar: add missing
 runtime dependency on python-werkzeug
In-Reply-To: <20200408213000.212212-1-romain.naour@gmail.com> (Romain Naour's
 message of "Wed, 8 Apr 2020 23:30:00 +0200")
References: <20200408213000.212212-1-romain.naour@gmail.com>
Message-ID: <87r1wct495.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Upstream commit
 > https://github.com/crossbario/crossbar/commit/b9c295d3cfa923b383f93fe534d40e42c56576dc
 > which has been part of the releases since v19.10.1 has added
 > werkzeug dependency.

 > Without werkzeug package, the test TestPythonPy3Crossbar
 > is failing at runtime with this error:

 > ModuleNotFoundError: No module named 'werkzeug'

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/498144523

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: James Hilliard <james.hilliard1@gmail.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
