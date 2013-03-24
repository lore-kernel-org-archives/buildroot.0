From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Mar 2013 20:49:37 +0100
Subject: [Buildroot] [PATCH 2/2] uboot: integrate mkenvimage.
In-Reply-To: <514F5580.7030302@zacarias.com.ar> (Gustavo Zacarias's message of
 "Sun, 24 Mar 2013 16:35:28 -0300")
References: <1356007638-18476-1-git-send-email-rebillout@syscom.ch>
 <1356007638-18476-2-git-send-email-rebillout@syscom.ch>
 <514F5580.7030302@zacarias.com.ar>
Message-ID: <87a9psinn2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> On 12/20/2012 09:47 AM, Arnaud R?billout wrote:
 >> This commit provides configuration options to automatically generate a
 >> binary environment image for U-Boot.
 >> Two options are available (and mandatory):
 >> * the location of a text file describing U-Boot environment.
 >> * the size of the environment.
 >> 
 >> Signed-off-by: Arnaud R?billout <rebillout@syscom.ch>

 Gustavo> Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed with some minor indentation/typo issues fixed, thanks.

-- 
Bye, Peter Korsgaard
