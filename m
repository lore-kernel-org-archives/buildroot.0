From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 09:07:48 +0100
Subject: [Buildroot] [PATCH] package/python-pyasn-modules: select
 correct option
In-Reply-To: <20191213142713.1358458-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 13 Dec 2019 15:27:13 +0100")
References: <20191213142713.1358458-1-thomas.petazzoni@bootlin.com>
Message-ID: <87woanwjl7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > BR2_PACKAGE_PYASN does not exist, it is BR2_PACKAGE_PYTHON_PYASN that
 > should be selected.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2019.02.x and 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
