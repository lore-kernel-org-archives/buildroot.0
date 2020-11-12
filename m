From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Nov 2020 22:32:31 +0100
Subject: [Buildroot] [PATCH 2/2] package/python-lmdb: bump to version
 0.99
In-Reply-To: <20201111233429.2245255-2-romain.naour@gmail.com> (Romain Naour's
 message of "Thu, 12 Nov 2020 00:34:29 +0100")
References: <20201111233429.2245255-1-romain.naour@gmail.com>
 <20201111233429.2245255-2-romain.naour@gmail.com>
Message-ID: <87h7pui7m8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > This version fix the runtime issue with python 3.9 since _Py_ForgetReference()
 > was removed from the limited C API [1].

 > $ python sample_python_crossbar.py
 > /usr/bin/python3.9: symbol '_Py_ForgetReference': can't resolve symbol

 > python-lmbd 0.99 contain a refactoring removing _Py_ForgetReference()
 > from the code.

 > Fixes:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/830981961
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/830981979

 > [1] https://docs.python.org/3/whatsnew/3.9.html#id3
 > [2] https://github.com/jnwatson/py-lmdb/commit/22a3724bdcda62853e8a250094f512eb20abe01f

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > ---
 > The version 0.99 is a bug fix release AFAIK.

Committed, thanks.

-- 
Bye, Peter Korsgaard
