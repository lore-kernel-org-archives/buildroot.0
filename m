From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 02 Mar 2019 21:12:53 +0100
Subject: [Buildroot] Python 2.7 end of life on January 1, 2020
In-Reply-To: <20190301195404.1c00356b@windsurf> (Thomas Petazzoni's message of
 "Fri, 1 Mar 2019 19:54:04 +0100")
References: <20190301195404.1c00356b@windsurf>
Message-ID: <87ef7pkpbu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Hello,
 > Through a LWN.net article, I recently realized that Python 2.7 will see
 > its end of life on January 1, 2020, according to:

 >   https://www.python.org/dev/peps/pep-0373/

 > You also have a fancy countdown at:

 >   https://pythonclock.org/

 > This means that our 2020.02 LTS release probably should not have Python
 > 2.x anymore ?

Yes, it is too late to change for 2019.02, but 2020.02 should probably
not include it unless somebody else steps up and maintains it when it
goes EOL.

 > If that's our decision, then we should probably discuss the deprecation
 > path we want to follow to strongly warn users that they should migrate
 > away from Python 2.x.

Hasn't that been the published statement by the upstream Python
developers ever since 3.x was released 10 years ago? I am not sure what
else we could/should do, besides perhaps mentioning it in the 2019.02
release notes?

-- 
Bye, Peter Korsgaard
