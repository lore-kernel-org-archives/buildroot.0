From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 16 Dec 2009 21:35:16 +0100
Subject: [Buildroot] update on a file in tslib not reflected after doing
	"Make"
In-Reply-To: <ed7750810912152030x7fd04fd1g70a959b28f4ab9e4@mail.gmail.com>
	(Stanley's message of "Wed, 16 Dec 2009 12:30:57 +0800")
References: <ed7750810912142330nbfb9fb5q2b261926c6d2b4c2@mail.gmail.com>
	<20091215092751.7d9a48fe@surf>
	<ed7750810912152030x7fd04fd1g70a959b28f4ab9e4@mail.gmail.com>
Message-ID: <87fx7a64jf.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stanley" == Stanley  <eva2002@gmail.com> writes:

 Stanley> I tried your method and also tried creating some patches for
 Stanley> editing the test file. However in both cases, the changes
 Stanley> still did not reflect.

 Stanley> However i did see that it got rebuilt after deleting
 Stanley> .stamp_built file. What I can try out now?  thanks

If you are putting new .patch files under package/tslib then you need to
rerun the patch step. The easiest way of doing this is simply to delete
the build dir (rm -rf output/build/tslib*)

-- 
Bye, Peter Korsgaard
