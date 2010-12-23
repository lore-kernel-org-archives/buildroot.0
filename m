From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 23 Dec 2010 09:16:10 +0100
Subject: [Buildroot] [PATCH 12/13] screen: bump to version 4.0.3
In-Reply-To: <20101223083303.07f8a70f@surf> (Thomas Petazzoni's message of
	"Thu, 23 Dec 2010 08:33:03 +0100")
References: <1292605474-19443-1-git-send-email-gustavo@zacarias.com.ar>
	<1292605474-19443-12-git-send-email-gustavo@zacarias.com.ar>
	<20101223083303.07f8a70f@surf>
Message-ID: <87zkrwsy45.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> On Fri, 17 Dec 2010 14:04:33 -0300
 Thomas> Gustavo Zacarias <gustavo@zacarias.com.ar> wrote:

 >> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 >> ---
 >> .../screen/screen-4.0.2-cross_compile_fix.patch    |  524 --------------------
 >> package/screen/screen-4.0.2_install-fix.patch      |   21 -
 >> package/screen/screen-cross_compile_fix.patch      |  524 ++++++++++++++++++++

 Thomas> I am not terribly happy about this cross_compile_fix patch that
 Thomas> directly hacks the ./configure script.

Me neither. Notice that it was just renamed here, not introduced.

 Thomas> In bce15df3bea6d1ab4a88db9d31fc2dd30418decc, Nikel Kukard said "The
 Thomas> cross compile fix is unavoidable". But do we have an idea of what the
 Thomas> problem is exactly ?

Sorry, haven't looked at it in details.

-- 
Bye, Peter Korsgaard
