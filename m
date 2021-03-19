From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 19 Mar 2021 21:27:38 +0100
Subject: [Buildroot] [PATCH 1/1] package/zyre: bump version to 2.0.1
In-Reply-To: <20210308122733.1404-1-jack.cripps@disguise.one> (Jack Cripps's
 message of "Mon, 8 Mar 2021 12:27:33 +0000")
References: <20210308122733.1404-1-jack.cripps@disguise.one>
Message-ID: <87eegavqh1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jack" == Jack Cripps <jack.cripps@disguise.one> writes:

 > Version bump required due to python setup.py missing from v2.0.0 python bindings

What does that mean exactly? How are those bindings installed and used?
We don't seem to do anything to handle them in zyre.mk?

 > Signed-off-by: Jack Cripps <jack.cripps@disguise.one>
 > ---
 > Backport to 2019.11.x

I take it you mean 2020.11.x here? 2020.02.x and 2021.02.x also has
zyre, so it is presumably needed there as well?

-- 
Bye, Peter Korsgaard
