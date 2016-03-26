From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Mar 2016 08:47:11 +0100
Subject: [Buildroot] [git commit] pulseview: needs boost
	atomic/date_time as well
In-Reply-To: <56F5C27F.4020100@zacarias.com.ar> (Gustavo Zacarias's message of
 "Fri, 25 Mar 2016 19:58:07 -0300")
References: <20160325215140.07917800F2@busybox.osuosl.org>
 <d6sgscxrmh.ln2@ID-313208.user.individual.net>
 <56F5C27F.4020100@zacarias.com.ar>
Message-ID: <8737rdel4w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > On 25/03/16 19:54, Bernd Kuhls wrote:
 >> Hi Peter,
 >> 
 >> building pulseview with this patch reverted works after the cmake bump to
 >> 3.5.1.

 > Hi Bernd.
 > cmake 3.5.1 fixed a FindBoost bug on indirect dependencies:

 > http://public.kitware.com/pipermail/cmake/2016-March/063085.html

Ahh, ok - I'll revert it then.

-- 
Bye, Peter Korsgaard
