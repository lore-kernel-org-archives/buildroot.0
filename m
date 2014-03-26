From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Mar 2014 22:08:17 +0100
Subject: [Buildroot] [git commit] beecrypt: only build C++ support if
	dependencies are available
In-Reply-To: <53331005.4070306@mind.be> (Arnout Vandecappelle's message of
 "Wed, 26 Mar 2014 18:36:05 +0100")
References: <20140326150517.4F60E9C3B2@busybox.osuosl.org>
 <53331005.4070306@mind.be>
Message-ID: <8738i4llby.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 26/03/14 16:01, Peter Korsgaard wrote:
 >> commit: http://git.buildroot.net/buildroot/commit/?id=205839d085508b83d9437f2fbe002ef076aa0cdb
 >> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> Instead of automatically pulling in the (big) icu library if the toolchain
 >> dependencies are available.

 >  Wouldn't it be more appropriate to make an explicit config option for it
 > then? I think this one falls under the category "Not obvious to the user
 > that he should select library XXX to enable feature YYY."

Possibly. It is imho somewhat similar to how we do for openssl, but I
can understand that the icu / C++ interface link might not be clear to
people.

 >  Patch follows.

Thanks.

-- 
Bye, Peter Korsgaard 
