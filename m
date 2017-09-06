From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Sep 2017 13:27:28 +0200
Subject: [Buildroot] [RFC] testing: add python-cryptography tests
In-Reply-To: <CAGm1_ktR=czPoLUdFpUnp4q2Ve_o=umgVgWOEkKnHdzkLyxvNQ@mail.gmail.com>
References: <20170904071500.3858-1-yegorslists@googlemail.com>
 <59af5dfae6364_331f1091a18551a0@ultri3.mail>
 <CAGm1_ktR=czPoLUdFpUnp4q2Ve_o=umgVgWOEkKnHdzkLyxvNQ@mail.gmail.com>
Message-ID: <20170906132728.250c7caa@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 6 Sep 2017 11:44:17 +0200, Yegor Yefremov wrote:

> > So I suppose the test you created is testing enough.
> > Could you (that knows more then me about the package) confirm it is OK to get
> > these messages?
> >
> > If you think testing for the output of the command is needed to determine
> > fail/pass, see TestNoTimezone. I didn't tested but I guess assertRegexpMatches
> > and assertNotRegexpMatches can be helpful.  
> 
> How can I perform tests for this testing framework locally?

You want to test the testing framework ? Seems weird.

Perhaps you just want to run the test cases ?

Quick start:

 ./support/testing/run-tests -l # to list the tests

 ./support/testing/run-tests -o /path/to/outputdir -k nameoftest # run a test case

> @Thomas do I see it right, that Python3 doesn't provide hashlib core
> property ans that this functionality is the by default compared to
> Python2?

Huh, I'm supposed to be able to answer this question ? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
