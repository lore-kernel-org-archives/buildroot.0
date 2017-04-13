From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Thu, 13 Apr 2017 20:44:31 -0300
Subject: [Buildroot] [RFC] Adopt a coding style for Python scripts
Message-ID: <58f00d5f9f9f2_1dd63f875a965624536da@ultri3.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, Maxime, Thomas, All,

First of all, I don't want to start a flame war.

I would like to know what you think about moving from A to D (or C or B) below.

A) keep using the implicit coding style for Python that we use now in Buildroot;

B) adopt a pre-existing Python coding style;
   The advantages of using a pre-existing one are: documenting on the manual
   takes a single sentence; for some coding styles there are automatic checkers
   to help during development/review.
   Of course there are coding style guides others than PEP8. But I don't know
   much about them.
   Do some of you use another coding style for Python? What are its advantages?

C) adopt the recommendation PEP8 [1] as coding style;

D) adopt the recommendation PEP8 [1] as coding style and the tool pep8 [2] as
   automatic checker for coding style before submitting patches;
   It checks for a subset of the recommendation (e.g. file naming is not
   checked).

What I am *NOT* proposing:
- use Python for every script;
- adapt all current Python scripts as the first step;
- enforce, starting now, 0 warnings from pep8 [2] before merging a patch;
- use an automatic formatter, like autopep8 [3];

My *personal* reasoning for using PEP8 [1] and pep8 [2] (outside Buildroot) is:
"Some people that wrote much more Python code than me already thought and
discussed about this to came up with this recommendation"
"I am lazy so I use the tool so I don't need to read the recommendation too
often"

[1] https://www.python.org/dev/peps/pep-0008/
[2] https://pypi.python.org/pypi/pep8
[3] https://pypi.python.org/pypi/autopep8

Regards,
Ricardo
