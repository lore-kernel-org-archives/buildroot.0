From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 27 Feb 2021 19:00:13 +0100
Subject: [Buildroot] [PATCH] utils/scanpypi: use python3 explicitly
In-Reply-To: <20210216214513.273743-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 16 Feb 2021 22:45:12 +0100")
References: <20210216214513.273743-1-thomas.petazzoni@bootlin.com>
Message-ID: <87v9ads85u.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > scanpypi is python3 compatible. In addition, it executes the setup.py
 > of Python modules to extract the relevant information. Since these are
 > more and more commonly using python3 constructs, using "python" to run
 > scanpypi causes problems on systems that have python2 installed as
 > python, when trying to parse setup.py scripts with python3 constructs.

 > Fixes part of #13516.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x and 2020.11.x, thanks.

-- 
Bye, Peter Korsgaard
