From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Oct 2015 17:14:18 +0200
Subject: [Buildroot] [PATCH V4 1/1] gmock: new package
In-Reply-To: <1438343622-6128-1-git-send-email-casantos@datacom.ind.br>
 (Carlos Santos's message of "Fri, 31 Jul 2015 08:53:42 -0300")
References: <1431713119-2821-1-git-send-email-casantos@datacom.ind.br>
 <1438343622-6128-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <87r3lc3rxx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

Hi,

Sorry for the slow response!

 > Inspired by jMock, EasyMock, and Hamcrest, and designed with C++'s
 > specifics in mind, Google C++ Mocking Framework (or Google Mock for
 > short) is a library for writing and using C++ mock classes.

 > Google Mock:

 >   * lets you create mock classes trivially using simple macros,
 >   * supports a rich set of matchers and actions,
 >   * handles unordered, partially ordered, or completely ordered
 >     expectations,
 >   * is extensible by users, and
 >   * works on Linux, Mac OS X, Windows, Windows Mobile, minGW, and
 >     Symbian.

 >   http://code.google.com/p/googlemock/

 > There are both host and target packages. The target one has include
 > files required to compile the tests and the static libraries required
 > to link/run them. The host package installs gmock_gen, a Python script
 > used to generate code mocks.

 > Notice that GMock 1.7.0 requires the Python 2 host package even if
 > Python 3 is selected as a target package.

 > Signed-off-by: Marcelo Barbosa <marcelo.barbosa@datacom.ind.br>
 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

Committed, thanks.

-- 
Bye, Peter Korsgaard
