From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Dec 2018 20:50:52 +0100
Subject: [Buildroot] [PATCH] support/testing: drop docstring in
 TestPythonPackageBase::test_run()
In-Reply-To: <20181208143615.31534-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sat, 8 Dec 2018 15:36:15 +0100")
References: <20181208143615.31534-1-thomas.petazzoni@bootlin.com>
Message-ID: <87wooj4x2b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Having a docstring in the test_run() method clutters the "run-tests
 > -l" output:

 > test_run (tests.package.test_python_crossbar.TestPythonPy3Crossbar)
 > Test a python package. ... ok
 > [...]
 > test_run (tests.package.test_python_pexpect.TestPythonPy2Pexpect)
 > Test a python package. ... ok
 > test_run (tests.package.test_python_pexpect.TestPythonPy3Pexpect)
 > Test a python package. ... ok
 > test_run (tests.package.test_python_twisted.TestPythonPy2Twisted)
 > Test a python package. ... ok
 > test_run (tests.package.test_python_twisted.TestPythonPy3Twisted)
 > Test a python package. ... ok
 > test_run (tests.package.test_python_pynacl.TestPythonPy2Pynacl)
 > Test a python package. ... ok
 > test_run (tests.package.test_python_pynacl.TestPythonPy3Pynacl)
 > Test a python package. ... ok

 > So let's simply drop this docstring that is not particularly useful.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
