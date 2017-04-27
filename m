From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Apr 2017 21:39:20 +0200
Subject: [Buildroot] [PATCH] docs/manual: PEP8 coding style for Python
	scripts
In-Reply-To: <20170424013356.2228-1-ricardo.martincoski@gmail.com> (Ricardo
 Martincoski's message of "Sun, 23 Apr 2017 22:33:56 -0300")
References: <20170424013356.2228-1-ricardo.martincoski@gmail.com>
Message-ID: <87d1bxk5cn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > The advantages of using a pre-existing coding style instead of creating
 > our own are:
 > - documenting on the manual takes a single sentence;
 > - there are automatic tools to help during development/review.

 > So document that PEP8 recommendation should be followed.

Seems sensible to me. Committed, thanks.

 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Cc: Samuel Martin <s.martin49@gmail.com>
 > Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > ---
 > Here is the sentence I didn't add:
 > The use of https://pypi.python.org/pypi/pycodestyle[Python style guide checker]
 > is recommended before submitting new scripts.

 > I mentioned in a thread the tool pep8/pycodestyle
 > From https://pypi.python.org/pypi/pycodestyle :
 > "This package used to be called pep8 but was renamed to pycodestyle to
 > reduce confusion"
 > Old url: https://pypi.python.org/pypi/pep8

 > Also Thomas DS mentioned the tool flake8 that seems to me to group:
 > pycodestyle + pyflakes + mccabe
 > http://flake8.pycqa.org/en/latest/

Ok. We don't get new python scripts that often, so it probably isn't a
huge deal.

-- 
Bye, Peter Korsgaard
