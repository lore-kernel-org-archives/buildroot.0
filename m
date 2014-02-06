From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 06 Feb 2014 23:14:22 +0100
Subject: [Buildroot] [git commit] opencv: cleanup depends and comments
In-Reply-To: <CAAXf6LWyLMeCSDot6mP2dEVCjEUqUb+Fd5qH0WxiXP2-Es6z=Q@mail.gmail.com>
 (Thomas De Schampheleire's message of "Thu, 6 Feb 2014 10:04:03
 +0100")
References: <20140205223406.275A79C67A@busybox.osuosl.org>
 <20140206095954.143a94ea@skate>
 <CAAXf6LWyLMeCSDot6mP2dEVCjEUqUb+Fd5qH0WxiXP2-Es6z=Q@mail.gmail.com>
Message-ID: <87vbwrlwht.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:

 >> Is this really our policy? It was mentioned several times that we
 >> should probably keep those, so that if the OpenCV package option itself
 >> no longer needs wchar or threads in the future, we already have those
 >> dependencies needed for the packages selected by OpenCV.
 >> 

 > Yes, I thought so too...

Ok, I'll revert it.

-- 
Bye, Peter Korsgaard 
