From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 Jul 2019 07:38:48 +0200
Subject: [Buildroot] [PATCH] package/python-django: bump to version 2.2.2
In-Reply-To: <e00bb722-d8a4-b357-3783-ccb6ccc476f3@mind.be> (Arnout
 Vandecappelle's message of "Thu, 4 Jul 2019 00:53:14 +0200")
References: <1561917244-1188-1-git-send-email-pjtexier@koncepto.io>
 <e00bb722-d8a4-b357-3783-ccb6ccc476f3@mind.be>
Message-ID: <87sgrm1hqv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 >  Hi Pierre-Jean,
 > On 30/06/2019 19:54, Pierre-Jean Texier wrote:
 >> Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>

 >  Peter posted a security bump to 2.1.10 shortly afterwards. I applied that one
 > instead, because I assume that that CVE-2019-12781 fix needs to be added on top
 > of 2.2.2 as well. Therefore, I've marked this patch as Changes Requested in
 > patchwork.

Yes, the same fix is available in 2.2.3. I submitted the 2.1.10 bump for
easy backporting to 2019.02.x / 2019.05.x, but I'm fine with moving to
the 2.2.x series for master as that is the new LTS series:

https://www.djangoproject.com/download/

-- 
Bye, Peter Korsgaard
