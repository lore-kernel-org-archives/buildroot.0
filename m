From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 19 Jul 2013 10:19:17 +0200
Subject: [Buildroot] [PATCH] arch/arm: add support for thumb(1) mode
In-Reply-To: <51E87032.3020102@zacarias.com.ar> (Gustavo Zacarias's message of
 "Thu, 18 Jul 2013 19:46:10 -0300")
References: <1374075555-9599-1-git-send-email-gustavo@zacarias.com.ar>
 <20130717175838.2fc2831e@skate> <51E6C06C.8070300@zacarias.com.ar>
 <20130717215826.60942218@skate> <51E719D4.4070304@zacarias.com.ar>
 <87zjtkwao1.fsf@dell.be.48ers.dk> <51E812BF.9060808@zacarias.com.ar>
 <87mwpjwlcf.fsf@dell.be.48ers.dk> <51E87032.3020102@zacarias.com.ar>
Message-ID: <87sizbuflm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On 07/18/2013 07:32 PM, Peter Korsgaard wrote:
 >> Actually the uClibc breakage seems to only be in the NPTL stuff. A test
 >> build without threads worked OK.

 Gustavo> Question is did (does) it really work or just built?

A statically built busybox with it atleast ran here. I didn't really
give it a lot of testing though.

-- 
Bye, Peter Korsgaard
