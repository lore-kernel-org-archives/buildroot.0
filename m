From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 16 Sep 2013 12:48:09 +0200
Subject: [Buildroot] build error since a change in apply-patches.sh
In-Reply-To: <5236E024.3030207@zacarias.com.ar> (Gustavo Zacarias's message of
 "Mon, 16 Sep 2013 07:40:36 -0300")
References: <9F3B5AF9F17649E5A569DE606814A046@JohanW7>
 <87y56xgkle.fsf@dell.be.48ers.dk> <5236E024.3030207@zacarias.com.ar>
Message-ID: <87txhlghzq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On 09/16/2013 06:51 AM, Peter Korsgaard wrote:
 >> Yes, I already brough this up here:
 >> 
 >> http://lists.busybox.net/pipermail/buildroot/2013-September/078292.html
 >> 
 >> I guess the best option is just to go back to warn on non-patches.

 Gustavo> Another headsup with apply-patches.sh:
 Gustavo> There's an unintented side-effect of
 Gustavo> 5871b791995ebe295db7dca608afe3f293ce8953 too, it may apply patches that
 Gustavo> are no longer necessary automatically via reverse (-R).
 Gustavo> We may see unintended unfixing of things with this, i've seen it happen
 Gustavo> to me with some yet unreleased fixes (the big automake bump).
 Gustavo> Maybe adding a -N to patch would be in order?

Yes, -N or -f would be good.

-- 
Bye, Peter Korsgaard
